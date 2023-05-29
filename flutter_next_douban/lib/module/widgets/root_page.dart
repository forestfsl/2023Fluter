// ignore_for_file: empty_statements, unnecessary_this, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  final String? title;
  final bool hasLeading;
  final TabBar? tabbar;
  final Widget? body;
  RootPage(
      {Key? key, this.title, required this.hasLeading, this.tabbar, this.body});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: title != null
          ? AppBar(
              leading: hasLeading
                  ? Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        );
                      },
                    )
                  : null,
              title: Text(
                title!,
                style: TextStyle(fontSize: 26),
              ),
              bottom: tabbar,
            )
          : null,
      body: this.body,
    );
  }
}
