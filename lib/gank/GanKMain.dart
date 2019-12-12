

import 'package:flutter/material.dart';
import 'package:ycflutter/gank/weight/GankDrawer.dart';
import 'package:ycflutter/gank/weight/IconFont.dart';
import 'package:ycflutter/res/YcColors.dart';

class GankMain extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new GankState();
  }
}

class GankState extends State<GankMain> {

  int _currentPageIndex;
  String _currentDate;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //navigatorKey: navigatorKey,
      //设置主题
      theme: ThemeData(
          accentColor: Colors.black,
          textSelectionColor: YcColors.colorWhite,
          primaryColor: YcColors.colorPrimary),
      //设置home
      home: new Scaffold(
        appBar: _buildAppBar(),
        drawer: GankDrawer(),
        //body主题内容
        body: new Center(
          child: ListTile(
            title: new Text("干活集中营"),
            trailing: new Icon(Icons.group_work),
            onTap: (){

            }
          ),
        ),
      ),
    );
  }

  ///build AppBar.
  Widget _buildAppBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Offstage(
        offstage: _currentPageIndex != 0,

        ///标题栏显示当前日期
        child: Text(_currentDate ?? ''),
      ),
      actions: <Widget>[_buildActions()],
    );
  }

  ///创建标题栏右侧按钮
  IconButton _buildActions() {
    return IconButton(
      icon: Icon(getActionsIcon(), size: 22, color: Colors.white),
      onPressed: () async {
        if (_currentPageIndex == 0) {
          ///显示/隐藏日期
        } else if (_currentPageIndex == 1) {
          ///去搜索页
        } else if (_currentPageIndex == 2) {
          ///切换妹纸图列数按钮
        } else {
        }
      },
    );
  }

  ///获取标题栏右侧图标.
  IconData getActionsIcon() {
    if (_currentPageIndex == 0) {
      return IconFont(0xe8a6);
    } else if (_currentPageIndex == 1) {
      return IconFont(0xe783);
    } else if (_currentPageIndex == 2) {
      return IconFont(0xe63a);
    } else {
      return null;
    }
  }

}