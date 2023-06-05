// ignore_for_file: avoid_print, prefer_generic_function_type_aliases, prefer_collection_literals, camel_case_types

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

typedef void onResponseCallback(int? statusCode, dynamic result);

class NetworkHelper {
  static NetworkHelper shared = NetworkHelper();

  void requestDoubanList(String url, onResponseCallback callback) {
    _getNetworkData(url, callback);
  }

  void _getNetworkData(String url, onResponseCallback callback) async {
    BaseOptions options = BaseOptions(
      method: 'get',
      baseUrl: url,
      connectTimeout: 5000,
      receiveTimeout: 10000,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.plain,
    );
    Dio dio = Dio(options);

    try {
      Response response = await dio.get(url);
      callback(response.statusCode, jsonDecode(response.data));
    } on DioError catch (e) {
      print('fal to get network,url: $url');
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
      } else {
        print(e.requestOptions);
      }
      callback(404, Map());
    }
  }
}
