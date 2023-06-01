// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/public/app_util.dart';
import 'package:flutter_next_douban/module/widgets/rank_container.dart';

class DisplayItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: _buildItem,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          width: (AppUtil.screenWidth - 4 * 80 - 10 - 15) / 3,
        );
      },
    ));
  }

  Widget _buildItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          // Image(
          //   image: AssetImage('assets/images/bg_books_stack_default.png'),
          //   width: 100,
          //   height: 100,
          // ),
          FadeInImage.assetNetwork(
              width: 80,
              height: 112,
              placeholder: "assets/images/bg_books_stack_default.png",
              image:
                  "http://img2.woyaogexing.com/2023/05/31/2f8b6b3b6d75e53e3744d0b0d95b963a.jpg"),

          Container(
            height: 10,
          ),
          RankContainer(
            width: 80,
            height: 34,
            rank: 4,
            score: 7.6,
          )
        ],
      ),
    );
  }
}
