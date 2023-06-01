// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, unused_field, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/public/app_util.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with TickerProviderStateMixin {
  late CurvedAnimation _curvedAnimation;
  late Animation<double> _animation;
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    // _curvedAnimation 和 _controller 代表展示两种不同的动画效果
    _animation = Tween(begin: 0.0, end: 300.0).animate(_curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new page1'),
      ),
      body: Center(
        child: Container(
          // width: AppUtil.screenWidth,
          // height: AppUtil.screenHeight,
          color: Colors.green,
          child: Image(
            image: AssetImage('assets/images/bg_music_stack_default.png'),
            width: _animation.value,
            height: _animation.value,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _controller.forward(),
        child: Icon(Icons.add),
      ),
    );
  }
}
