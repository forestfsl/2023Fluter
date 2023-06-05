// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_field, unused_element, prefer_final_fields, sized_box_for_whitespace, sort_child_properties_last

import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/category/category_data_source.dart';
import 'package:flutter_next_douban/module/category/category_detail_item.dart';
import 'package:flutter_next_douban/module/model/douban_model.dart';
import 'package:flutter_next_douban/module/widgets/root_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryPage extends StatefulWidget {
  late final DoubanCategory category;

  CategoryPage({Key? key, required this.category});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  int _currentTab = 0;
  late TabController _tabController;
  // RefreshController _refreshController =
  //     RefreshController(initialRefresh: false);
  // RefreshController _refreshController1 =
  //     RefreshController(initialRefresh: false);
  // RefreshController _refreshController2 =
  //     RefreshController(initialRefresh: false);
  late RefreshController _refreshController;
  late CategoryDataSource _dataSource;
  //itemCount 假数据
  int itemCount = 10;

  @override
  void initState() {
    super.initState();
    _initDataSource();
    _tabController = TabController(
        length: DoubanModel.getMoreTitle(widget.category).length, vsync: this);
  }

  void _onDataCallback() {
    _refreshController.loadComplete();
    _dataSource.isPageLoading = false;
    setState(() {});
  }

  void _initDataSource() {
    _dataSource = CategoryDataSource(onDataCallback: _onDataCallback);

    //进行数据请求
    _requestData();
  }

  void _requestData() {
    if (widget.category == DoubanCategory.Movie) {
      if (_currentTab == 0) {
        _dataSource.requestRecentMovie();
      } else if (_currentTab == 1) {
        _dataSource.requestCollectionMovie();
      } else if (_currentTab == 2) {
        _dataSource.requestHotMovie();
      }
    }
  }

  void _onLoading() {
    _dataSource.page++;
    _requestData();
    // Future.delayed(Duration(seconds: 2), () {
    //   _refreshController.loadComplete();
    //   itemCount += 5;
    //   setState(() {});
    // });
  }

  void _onTabbarTapped(int index) {
    _currentTab = index;
    _dataSource.reset();
    _requestData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.category);

    return RootPage(
        hasLeading: true,
        title: DoubanModel.getDoubanTitle(widget.category),
        tabbar: _configTabbar(),
        body: TabBarView(
          controller: _tabController,
          children: _configTabsBarViews(),
        ));
  }

  TabBar _configTabbar() {
    return TabBar(
      onTap: _onTabbarTapped,
      controller: _tabController,
      unselectedLabelColor: Colors.white,
      indicatorColor: Colors.white,
      labelColor: Colors.white,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      unselectedLabelStyle:
          TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
      labelPadding: EdgeInsets.only(bottom: 8),
      tabs: _configTabs(),
    );
  }

  List<Widget> _configTabs() {
    List<Widget> tablist = [];
    for (int i = 0; i < DoubanModel.getMoreTitle(widget.category).length; i++) {
      tablist.add(Text(DoubanModel.getMoreTitle(widget.category)[i]));
    }
    return tablist;
  }

  Widget _configCategoryList() {
    _refreshController = RefreshController(initialRefresh: false);
    if (_dataSource.isPageLoading) {
      return CupertinoActivityIndicator();
    } else {
      return SmartRefresher(
        controller: _refreshController,
        enablePullDown: false,
        enablePullUp: true,
        onLoading: _onLoading,
        child: ListView.separated(
          itemCount: _dataSource.movieList.length,
          itemBuilder: _buildItem,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 21,
            );
          },
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              return Container();
            } else if (mode == LoadStatus.loading) {
              return CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text('Load Failed');
            } else if (mode == LoadStatus.canLoading) {
              body = Text('release to load');
            } else {
              body = Text('No more data');
            }
            return Container(height: 55, child: Center(child: body));
          },
        ),
      );
    }
  }

  Widget _buildItem(BuildContext context, int index) {
    if (_dataSource.isPageLoading) {
      return Container();
    }
    return CategoryDetailItem(
      movie2: _dataSource.movieList[index],
    );
  }

  List<Widget> _configTabsBarViews() {
    List<Widget> tabbarViews = [];
    for (int i = 0; i < DoubanModel.getMoreTitle(widget.category).length; i++) {
      tabbarViews.add(_configCategoryList());
    }
    return tabbarViews;
  }
}
