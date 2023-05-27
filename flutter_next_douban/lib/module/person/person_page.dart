// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class PersonPage extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('this is person page'),
    );
  }
}
