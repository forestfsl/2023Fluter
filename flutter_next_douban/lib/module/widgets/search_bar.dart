// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class SearchBar1 extends StatelessWidget {
  final bool isEnable;
  final void Function(String value)? onSubmit;

  SearchBar1({Key? key, required this.isEnable, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 32,
      child: TextField(
        enabled: isEnable,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(Icons.search),
            border: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(19.5))),
        onSubmitted: onSubmit,
      ),
    );
  }
}
