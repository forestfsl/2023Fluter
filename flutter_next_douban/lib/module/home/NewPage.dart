// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, unused_field, avoid_unnecessary_containers, unnecessary_overrides, sort_child_properties_last, unused_import, prefer_const_constructors_in_immutables, override_on_non_overriding_member, annotate_overrides, unused_local_variable, unused_element, avoid_print, prefer_final_fields, duplicate_import

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/public/app_util.dart';
import 'dart:math' as math;
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> with TickerProviderStateMixin {
  int _counter = 0;
  Dio _dio = Dio();
  @override
  void initState() {
    super.initState();
    _readCount().then((value) {
      setState(() {
        _counter = value;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<int> _readCount() async {
    try {
      File file = await _getLocalFile();
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<File> _getLocalFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    return File('$dir/counter.text');
  }

  Future onPressed() async {
    setState(() {
      _counter++;
    });
    //做一个存储
    await (await _getLocalFile()).writeAsString('$_counter');

    //发送网络请求
    // _getNetwork();
    // requestGetNetwork();
    // requestPostNetwork();
  }

//dio 库发请求
  void requestGetNetwork() async {
    Response rsp;
    rsp = await _dio.get("http://www.baidu.com");
    print("###################################");
    print(rsp.data);
    print("###################################");
  }

  void requestPostNetwork() async {
    Response rsp;
    Future.wait([
      _dio.post("http://www.baidu.com"),
      _dio.post("http://www.douban.com")
    ]);
  }

  void _getNetwork() async {
    HttpClient httpClient = HttpClient();
    HttpClientRequest request =
        await httpClient.getUrl(Uri.parse('https://www.baidu.com'));
    // request.headers.add(name, value); header
    // request.add(data); body
    HttpClientResponse response = await request.close();

    print(response.headers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('$_counter'),
        ),
        body: Center(
            child: FutureBuilder(
          future: _dio.get("https://api.github.com/orgs/flutterchina/repos"),
          builder: (BuildContext context,
              AsyncSnapshot<Response<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Response? response = snapshot.data;
              if (snapshot.hasError) {
                return Text("network is error");
              } else {
                print(response!.data);
                return Text("network is done");
              }
            }
            return CircularProgressIndicator();
          },
        )),
        // body: Center(
        //     child: CustomPaint(
        //   painter: _CircleProgressPainter(0.5, Colors.green, Colors.grey, 4),
        //   size: Size(40, 40),
        // )
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: onPressed,
          child: Icon(Icons.add),
        ));
  }
}

class _CircleProgressPainter extends CustomPainter {
  late final double progress;
  late final Color primaryColor;
  late final Color secondaryColor;
  late final double strokeWidth;

  _CircleProgressPainter(
      this.progress, this.primaryColor, this.secondaryColor, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    final canvasWidth = size.width > size.height ? size.height : size.width;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = canvasWidth / 2 - strokeWidth / 2;
    final rect = Rect.fromCircle(center: center, radius: radius);
    final primaryStrokeWidth = strokeWidth;

    final primaryPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = primaryStrokeWidth
      ..strokeCap = StrokeCap.round;

    final secondaryPaint = Paint()
      ..color = secondaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = primaryStrokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, secondaryPaint);

    Path path = Path();
    if (progress > 0 && progress < 1) {
      path.arcTo(rect, -math.pi / 2, 2 * math.pi * progress, false);
      canvas.drawPath(path, primaryPaint);
    } else if (progress == 0) {
      return;
    } else {
      canvas.drawCircle(center, radius, primaryPaint);
    }
  }

  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
