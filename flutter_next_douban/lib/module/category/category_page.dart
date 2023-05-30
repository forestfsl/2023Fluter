// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:flutter_next_douban/module/model/douban_model.dart';
import 'package:flutter_next_douban/module/widgets/root_page.dart';

class CategoryPage extends StatefulWidget {
  late final DoubanCategory category;

  CategoryPage({Key? key, required this.category});

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: DoubanModel.getMoreTitle(widget.category).length, vsync: this);
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

  List<Widget> _configTabsBarViews() {
    List<Widget> tablist = [];
    for (int i = 0; i < DoubanModel.getMoreTitle(widget.category).length; i++) {
      tablist.add(Text(DoubanModel.getMoreTitle(widget.category)[i]));
    }
    return tablist;
  }
}
