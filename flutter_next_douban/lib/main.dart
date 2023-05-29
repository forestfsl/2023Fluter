// ignore_for_file: avoid_print, unnecessary_import

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/serach/search_page.dart';
import 'package:flutter_next_douban/module/navigation_bar/navigation_bar.dart';

void main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    print('flutter catch error: $details');
  };
  runZoned(() => runApp(MyApp()), onError: (Object obj, StackTrace stack) {
    print('fluuter catch error, obj: $obj, \nstack: $stack');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Map<String, WidgetBuilder> _routes() {
    return {'/search': (BuildContext context) => SearchPage()};
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: _routes(),
      home: NavigationBar1(),
    );
  }
}
