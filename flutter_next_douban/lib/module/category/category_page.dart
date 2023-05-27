// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/model/douban_model.dart';

class CategoryPage extends StatefulWidget {
  late final DoubanCategory category;

  CategoryPage({Key? key, required this.category});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.category);
    return Center(
      child: Text('this is category page'),
    );
  }
}
