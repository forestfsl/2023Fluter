// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, unused_field, avoid_unnecessary_containers, unnecessary_overrides, sort_child_properties_last, unused_import, prefer_const_constructors_in_immutables, override_on_non_overriding_member, annotate_overrides, unused_local_variable, unused_element, avoid_print, prefer_final_fields, duplicate_import, unnecessary_const, unused_catch_clause

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_next_douban/module/public/app_util.dart';
import 'dart:math' as math;
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with TickerProviderStateMixin {
  //通道名称
  static const platform = const MethodChannel('next.flutter.io/battery');
  String _batteryLevel = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future _getBatteryLevel() async {
    String batteryLevel;

    try {
      //方法名
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Current Battery level is $result %';
    } on PlatformException catch (e) {
      batteryLevel = "Fail to get current battery level";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('new page'),
        ),
        body: Center(
          child: Column(children: [
            OutlinedButton(
              child: Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            Text(_batteryLevel)
          ]),
        ));
  }
}
