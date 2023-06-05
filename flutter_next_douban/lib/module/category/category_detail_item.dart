// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/model/movie.dart';
import 'package:flutter_next_douban/module/widgets/rank_container.dart';

class CategoryDetailItem extends StatelessWidget {
  final Movie2 movie2;

  const CategoryDetailItem({super.key, required this.movie2});

  void _onItemTapped() {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onItemTapped,
      child: Container(
        padding: EdgeInsets.only(left: 24, right: 24, top: 9),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInImage.assetNetwork(
                width: 86,
                height: 122,
                placeholder: "assets/images/bg_books_stack_default.png",
                image: movie2.cover),
            // "http://img2.woyaogexing.com/2023/05/31/2f8b6b3b6d75e53e3744d0b0d95b963a.jpg"),
            Container(
              width: 14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RankContainer(
                  height: 40,
                  width: 220,
                  title: movie2.title,
                  rank: movie2.rate.toInt(),
                  score: 7.8,
                ),
                Container(
                  height: 3,
                ),
                Container(
                  width: 220,
                  child: Text(
                    '发送机考的法律辅导老师发送链接',
                    style: TextStyle(fontSize: 10, color: Color(0xFF999999)),
                    maxLines: 5,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
