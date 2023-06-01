// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, unused_field, avoid_unnecessary_containers, unnecessary_overrides, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/public/app_util.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new page1'),
      ),
      body: Container(
        child: InkWell(
          child: Hero(
            tag: 'next',
            child: Image(
              image: AssetImage('assets/images/bg_music_stack_default.png'),
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(pageBuilder:
                (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
              return FadeTransition(
                opacity: animation,
                child: HeroRoute(),
              );
            }));
          },
        ),
      ),
    );
  }
}

class HeroRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('heor'),
        ),
        body: Center(
          child: Hero(
            child: Image(
              image: AssetImage('assets/images/bg_music_stack_default.png'),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            tag: 'next',
          ),
        ));
  }
}
