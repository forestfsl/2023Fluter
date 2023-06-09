// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/category/category_page.dart';
import 'package:flutter_next_douban/module/home/NewPage1.dart';
import 'package:flutter_next_douban/module/home/fade_route.dart';
import 'package:flutter_next_douban/module/home/recomment_item.dart';
import 'package:flutter_next_douban/module/model/douban_model.dart';
import 'package:flutter_next_douban/module/public/app_util.dart';
import 'package:flutter_next_douban/module/serach/search_page.dart';
import 'package:flutter_next_douban/module/widgets/jump_route.dart';
import 'package:flutter_next_douban/module/widgets/root_page.dart';
import 'package:flutter_next_douban/module/widgets/search_bar.dart';
import 'package:next_widgets/next_widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  void _onSearchBarTapped() {
    // Navigator.pushNamed(context, '/search');
    //临时假数据测试
    // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
    //   return CategoryPage(category: DoubanCategory.Movie);
    // }));

    Navigator.push(context, JumpRoute(builder: (BuildContext context) {
      return SearchPage();
    }));
  }

  bool _onScanTapped() {
    ToastUtil.show(context, '测试Toast');
    //第一种方式跳转
    // Navigator.pushNamed(context, '/newpage');
    //第二种方式跳转
    // Navigator.push(
    //     context, CupertinoPageRoute(builder: (context) => NewPage()));
    //第三种方式跳转
    // Navigator.push(
    //     context,
    //     PageRouteBuilder(
    //         transitionDuration: Duration(milliseconds: 500),
    //         pageBuilder: (BuildContext context, Animation<double> animation,
    //             Animation secondaryAnimation) {
    //           return FadeTransition(opacity: animation, child: NewPage());
    //         }));
    //第四种自定义路由
    // Navigator.push(context, FadeRoute(builder: (context) {
    //   return NewPage();
    // }));
    return true;
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
      height: 150,
      color: Color(0xFF33C9FF),
      child: SafeArea(
          child: Container(
        height: 52,
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 20, right: 20, left: 15),
        child: _configSearchBar(),
      )),
    );
  }

  Widget _configBottomWidget() {
    return Positioned(
      top: 102,
      child: Container(
        padding: EdgeInsets.zero,
        width: AppUtil.screenWidth,
        height: AppUtil.screenHeight - 102,
        // color: Colors.green,
        child: ListView(children: [
          RecommentItem(
            context: context,
            category: DoubanCategory.Movie,
          ),
          RecommentItem(
            context: context,
            category: DoubanCategory.Book,
          ),
          RecommentItem(
            context: context,
            category: DoubanCategory.Music,
          ),
        ]),
      ),
    );
  }

  Widget _configSearchBar() {
    //   return Image(
    //       image: AssetImage('lib/images/want_watch.png'), width: 54, height: 54);
    // }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _onSearchBarTapped,
          child: SearchBar1(isEnable: false),
        ),
        Expanded(
            child: IconButton(
                onPressed: _onScanTapped,
                icon: Icon(Icons.search_sharp),
                iconSize: 26)),

        // Expanded(
        //     child: Image(
        //   image: AssetImage('lib/images/scan.png'),
        //   width: 46,
        //   height: 46,
        // ))
      ],
    );
  }
}
// https://github.com/flutter/flutter/issues/93721