import 'package:flutter_next_douban/common/network/network_helper.dart';
import 'package:flutter_next_douban/module/model/movie.dart';

class CategoryDataSource {
  final void Function() onDataCallback;

  CategoryDataSource({
    required this.onDataCallback,
  });

  bool isCollection = false;
  int page = 1;
  bool isPageLoading = true;

  List movieList = [];

  void reset() {
    movieList.clear();
    page = 0;
    isPageLoading = true;
  }

  //Movie
  void requestRecentMovie() {
    String url =
        "https://movie.douban.com/j/search_subjects?type=movie&tag=%E6%9C%80%E6%96%B0&page_limit=50&page_start=$page";
    NetworkHelper.shared.requestDoubanList(url, _onMovieCallback);
  }

  void requestCollectionMovie() {
    isCollection = true;
    String url =
        "https://movie.douban.com/j/search_subjects?type=movie&tag=%E8%B1%86%E7%93%A3%E9%AB%98%E5%88%86&page_limit=50&page_start=$page";
    NetworkHelper.shared.requestDoubanList(url, _onMovieCallback);
  }

  void requestHotMovie() {
    String url =
        "https://movie.douban.com/j/search_subjects?type=movie&tag=%E7%83%AD%E9%97%A8&page_limit=50&page_start=$page";
    NetworkHelper.shared.requestDoubanList(url, _onMovieCallback);
  }

  void _onMovieCallback(int? statusCode, dynamic resultMap) {
    // reset();
    if (statusCode == 200 && resultMap is Map) {
      if (isCollection) {
        List subjectsList = resultMap['subjects'];
        for (dynamic result in subjectsList) {
          movieList.add(Movie2.castFromMap(result));
        }
        //回调出去刷新UI
        onDataCallback();
      } else {
        List subjectsList = resultMap['subjects'];
        for (dynamic result in subjectsList) {
          movieList.add(Movie2.castFromMap(result));
        }
        //回调出去刷新UI
        onDataCallback();
      }
      isCollection = false;
    }
  }
}
