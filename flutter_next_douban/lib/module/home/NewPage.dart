// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, unused_field, avoid_unnecessary_containers, unnecessary_overrides, sort_child_properties_last, unused_import, prefer_const_constructors_in_immutables, override_on_non_overriding_member, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/public/app_util.dart';
import 'dart:math' as math;

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
      body: Center(
          child: CustomPaint(
        painter: _CircleProgressPainter(0.5, Colors.green, Colors.grey, 4),
        size: Size(40, 40),
      )),
    );
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
