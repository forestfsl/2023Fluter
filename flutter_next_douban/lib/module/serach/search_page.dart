// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, unused_element, use_full_hex_values_for_flutter_colors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, prefer_const_constructors_in_immutables, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/public/app_util.dart';
import 'package:flutter_next_douban/module/serach/search_data_source.dart';
import 'package:flutter_next_douban/module/widgets/root_page.dart';
import 'package:flutter_next_douban/module/widgets/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  late SearchDataSource _dataSource;

  @override
  void initState() {
    super.initState();
    _dataSource = SearchDataSource();
    _dataSource.readRecentSearch().then((value) => splitWord(value));
  }

  void splitWord(String value) {
    if (value == '') {
      return;
    }
    _recentWords = AppUtil.spiltWord(value);

    setState(() {});
  }

  void _onSubmitted(String value) {
    //1.进行搜索

    //2.进行存储
    _dataSource.saveInput(AppUtil.componentWords(value, _recentWords));
  }

  void _onCancelTapped() {
    Navigator.pop(context);
  }

  void _onClearTap() {
    _dataSource.clear();
    _recentWords.clear();
    setState(() {});
  }

  //存储从磁盘上面搜索的单词
  List<String> _recentWords = [];

  @override
  Widget build(BuildContext context) {
    return RootPage(
      body: Container(
        height: 170,
        color: Color(0xFF333C9FF),
        child: SafeArea(
          child: Column(
            children: [_configTopWidget(), _configRecentSearchContainer()],
          ),
        ),
      ),
    );
  }

  Widget _configTopWidget() {
    return Container(
      height: 52,
      padding: EdgeInsets.only(top: 20, right: 20, left: 15),
      child: _configSearchBar(),
    );
  }

  Widget _configSearchBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchBar1(isEnable: true, onSubmit: _onSubmitted),
        GestureDetector(
          onTap: _onCancelTapped,
          child: Text(
            '取消',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _configRecentSearchContainer() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 12, 12, 0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '最近搜索',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            GestureDetector(
              onTap: _onClearTap,
              child: Text(
                '清除',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            )
          ],
        ),
        _configSearchWordList()
      ]),
    );
  }

  Widget _configSearchWordList() {
    return Container(
      height: 28,
      margin: EdgeInsets.only(top: 4),
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return SearchWording(
              word: '${_recentWords[index]}',
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              width: 10,
            );
          },
          itemCount: _recentWords.length),
    );
  }
}

class SearchWording extends StatelessWidget {
  final String? word;

  SearchWording({this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
      decoration: BoxDecoration(
          color: Color(0x1f000000), borderRadius: BorderRadius.circular(4)),
      child: Text(
        word!,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
