// ignore_for_file: unnecessary_string_interpolations

import 'dart:core';

class AppUtil {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;

  static List<String> spiltWord(String word) {
    return word.split(',');
  }

  static String componentWords(String input, List<String> list) {
    String value = '';
    if (list.isEmpty) {
      value = input;
      return value;
    } else {
      value = '${list[0]}';
    }
    for (int i = 1; i < list.length; i++) {
      value += ',${list[i]}';
    }
    value += ',$input';
    return value;
  }
}
