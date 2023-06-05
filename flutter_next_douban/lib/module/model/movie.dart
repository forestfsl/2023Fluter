// ignore_for_file: prefer_is_empty, non_constant_identifier_names

import 'package:flutter_next_douban/module/public/app_util.dart';
import 'package:flutter_next_douban/module/public/cast_util.dart';

class Movie2 {
  String id = '';
  double rate = 0;
  String title = '';
  String url = '';
  bool playable = true;
  bool is_new = true;
  String cover = '';

  Movie2.castFromMap(dynamic map) {
    if (map['id'] != null) {
      id = map['id'];
    }

    if (map['rate'] != null) {
      rate = StringToDouble(map['rate'])!;
    }

    if (map['title'] != null) {
      title = map['title'];
    }

    if (map['cover'] != null) {
      cover = map['cover'];
    }

    if (map['url'] != null) {
      url = map['url'];
    }
  }
}

class Movie {
  String id = '';
  String title = '';
  double rating = 0;
  int rank = 0;
  List genres = [];
  List casts = [];
  String durations = '';
  List directors = [];
  String year = '';
  String image = '';

  Movie.castFromMap(dynamic map) {
    if (map['id'] != null) {
      id = map['id'];
    }

    if (map['title'] != null) {
      title = map['title'];
    }

    if (map['rating'] != null && map['rating'] is Map) {
      Map ratingMap = map['rating'];
      if (ratingMap['average'] != null) {
        rating = StringToDouble(ratingMap['average'])!;
        rank = AppUtil.getRank(rating);
      }
    }

    if (map['genres'] != null && map['genres'] is List) {
      genres = map['genres'];
    }

    if (map['casts'] != null && map['casts'] is List) {
      for (dynamic cast in map['casts']) {
        casts.add(Cast._castFromMap(cast));
      }
    }

    if (map['directors'] != null && map['directors'] is List) {
      for (dynamic cast in map['directors']) {
        casts.add(Cast._castFromMap(cast));
      }
    }

    if (map['durations'] != null && map['durations'] is List) {
      List durationList = map['durations'];
      if (durationList.length > 0) {
        durations = durationList[0];
      }
    }

    if (map['year'] != null) {
      year = map['year'];
    }

    if (map['image'] != null) {
      image = map['image'];
    }
  }
}

class Cast {
  String alt = '';
  String avatar = '';
  String name = '';
  String id = '';

  Cast._castFromMap(dynamic map) {
    if (map['alt'] != null) {
      alt = map['alt'];
    }

    if (map['avatar'] != null) {
      avatar = map['avatar'];
    }

    if (map['name'] != null) {
      name = map['name'];
    }

    if (map['id'] != null) {
      id = map['id'];
    }
  }
}
