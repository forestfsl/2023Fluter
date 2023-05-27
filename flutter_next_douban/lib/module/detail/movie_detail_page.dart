// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('this is movie detail page'),
    );
  }
}
