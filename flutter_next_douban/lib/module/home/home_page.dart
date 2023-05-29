// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/widgets/root_page.dart';
import 'package:flutter_next_douban/module/widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  void _onSearchBarTapped() {
    Navigator.pushNamed(context, '/search');
  }

  @override
  Widget build(BuildContext context) {
    return RootPage(
      hasLeading: false,
      body: Stack(
        children: <Widget>[
          Container(),
          _configTopWidget(),
          _configBottomWidget()
        ],
      ),
    );
  }

  Widget _configTopWidget() {
    return Container(
        height: 170,
        color: Color(0xFF33C9FF),
        child: SafeArea(
            child: Container(
          height: 52,
          // width: 100,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 20, right: 100, left: 15),
          //color: Colors.red,
          child: _configSearchBar(),
        )));
  }

  Widget _configBottomWidget() {
    return Positioned(
      top: 150,
      child: Container(height: 500),
    );
  }

  Widget _configSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _onSearchBarTapped,
            child: SearchBar1(isEnable: false),
          ),
        ),
        Image(
          image: AssetImage('lib/images/scan.png'),
          width: 32,
          height: 32,
        )
      ],
    );
    // return SearchBar();
  }
}
