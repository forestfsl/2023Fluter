// ignore_for_file: constant_identifier_names

enum DoubanCategory { Movie, Book, Music }

class DoubanModel {
  static String getDoubanTitle(DoubanCategory category) {
    if (category == DoubanCategory.Movie) {
      return '电影';
    } else if (category == DoubanCategory.Book) {
      return '图书';
    } else {
      return '音乐';
    }
  }
}
