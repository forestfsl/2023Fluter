// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_field, unused_element, prefer_final_fields, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  late TabController _tabController;
  RefreshController _refreshController = RefreshController();
  int itemCount = 10;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: DoubanModel.getMoreTitle(widget.category).length, vsync: this);
  }

  void _onLoading() {
    Future.delayed(Duration(seconds: 2), () {
      _refreshController.loadComplete();
      itemCount += 5;
      setState(() {});
    });
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
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: false,
      enablePullUp: true,
      onLoading: _onLoading,
      child: ListView.separated(
        itemCount: 10,
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

  Widget _buildItem(BuildContext context, int index) {
    return CategoryDetailItem();
  }

  List<Widget> _configTabsBarViews() {
    List<Widget> tabbarViews = [];
    for (int i = 0; i < DoubanModel.getMoreTitle(widget.category).length; i++) {
      tabbarViews.add(_configCategoryList());
    }
    return tabbarViews;
  }
}
