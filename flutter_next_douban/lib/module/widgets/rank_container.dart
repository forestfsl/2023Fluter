// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors, unnecessary_this, sized_box_for_whitespace

import 'package:flutter/material.dart';

class RankContainer extends StatelessWidget {
  final String title;
  final int rank;
  final double score;
  final double width;
  final double height;
  final double startWidth;

  RankContainer(
      {Key? key,
      this.title = "默认",
      this.rank = 0,
      this.score = 0,
      this.width = 0,
      this.height = 0,
      this.startWidth = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: this.width,
            height: this.height,
            child: Text(
              title,
              style: TextStyle(fontSize: 12, color: Colors.black),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            width: this.width > 90 ? 90 : this.width,
            height: 14,
            child: Row(
              children: [
                Expanded(
                    child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    if (index < rank) {
                      return Image(
                          image: AssetImage('assets/images/star_blue.png'),
                          width: startWidth,
                          height: startWidth);
                    } else {
                      return Image(
                          image: AssetImage('assets/images/star_grey.png'),
                          width: startWidth,
                          height: startWidth);
                    }
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 2,
                    );
                  },
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                )),
                Text(
                  '$score',
                  style: TextStyle(fontSize: 10, color: Color(0xFF999999)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
