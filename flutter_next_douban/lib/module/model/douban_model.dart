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

  static List<String> getMoreTitle(DoubanCategory category) {
    if (category == DoubanCategory.Movie) {
      return ['近期热映', '猜你喜欢', '豆瓣热门'];
    } else if (category == DoubanCategory.Book) {
      return ['新书推荐', '今日推荐', '豆瓣热门'];
    } else {
      return ['新碟版', '豆瓣热门'];
    }
  }
}
