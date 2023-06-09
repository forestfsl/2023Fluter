// ignore_for_file: avoid_print, unnecessary_import, prefer_const_constructors, unused_import, depend_on_referenced_packages, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/home/NewPage.dart';
import 'package:flutter_next_douban/module/home/NewPage1.dart';
import 'package:flutter_next_douban/module/serach/search_page.dart';
import 'package:flutter_next_douban/module/navigation_bar/navigation_bar.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
    return {
      '/search': (BuildContext context) => SearchPage(),
      '/newpage': (BuildContext context) => NewPage()
    };
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
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate, //定义本地文本
        GlobalWidgetsLocalizations.delegate //定义方向
      ],
      supportedLocales: [const Locale('en', 'US'), const Locale('zh', 'CN')],
      // locale: const Locale('en','US'),
      localeResolutionCallback: localeCallback,
    );
  }

  Locale localeCallback(Locale? locale, Iterable<Locale> supportedLocalse) {
    print(locale);
    print(supportedLocalse);
    return Locale('zh', 'CN');
  }
}
