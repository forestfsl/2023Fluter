// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unnecessary_this, prefer_const_constructors_in_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/category/category_page.dart';
import 'package:flutter_next_douban/module/home/display_item.dart';
import 'package:flutter_next_douban/module/model/douban_model.dart';

class RecommentItem extends StatelessWidget {
  final DoubanCategory category;
  final BuildContext context;

  RecommentItem(
      {Key? key, required this.context, this.category = DoubanCategory.Movie});

  void _onMoreTapped() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return CategoryPage(category: this.category);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      padding: EdgeInsets.only(left: 15),
      child: Column(children: [
        _configTitleItem(),
        Container(
          height: 10,
        ),
        DisplayItem()
      ]),
    );
  }

  Widget _configTitleItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          DoubanModel.getDoubanTitle(category),
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        GestureDetector(
            onTap: _onMoreTapped,
            child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  '更多',
                  style: TextStyle(fontSize: 14, color: Colors.green),
                )))
      ],
    );
  }
}
