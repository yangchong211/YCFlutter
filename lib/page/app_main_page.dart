/*
Copyright 2017 yangchong211（github.com/yangchong211）

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'package:flutter/material.dart';
import 'package:ycflutter/page/me/AboutMePage.dart';
import 'package:ycflutter/page/me/SettingPage.dart';
import 'package:ycflutter/android/weight/SmartDrawer.dart';
import 'package:ycflutter/common/Constants.dart';
import 'package:ycflutter/android/pages/find/FindPage.dart';
import 'package:ycflutter/android/pages/home/HomePage.dart';
import 'package:ycflutter/page/me/MePage.dart';
import 'package:ycflutter/android/pages/search/SearchPage.dart';
import 'package:ycflutter/android/pages/todo/TodoPage.dart';
import 'package:ycflutter/res/YcColors.dart';
import 'package:ycflutter/utils/EventBus.dart';
import 'package:ycflutter/utils/LogUtils.dart';

//有状态的组件（Stateful widget）
//无状态的组件（Stateless widget）
//Stateful widget可以拥有状态，这些状态在widget生命周期中是可以变的，而Stateless widget是不可变的
class AppMainPage extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    MainDartState mainDartState = new MainDartState();
    return mainDartState;
  }
}

class MainDartState extends State<AppMainPage> with TickerProviderStateMixin {

  int _counter = 0;
  dynamic d = 1;
  //变量
  //默认索引
  int positionIndex = 0;
  //底部导航栏，定义数组
  var mainTitles = ['首页', '发现','其他', '我的'];
  var indexStack;
  List<BottomNavigationBarItem> navigationViews;
  //
  final navigatorKey = GlobalKey<NavigatorState>();
  final String TAG = "AppMainPage-----";

  //在构建页面时，会调用组件的build方法
  //widget的主要工作是提供一个build()方法来描述如何构建UI界面
  //通常是通过组合、拼装其它基础widget
  //重写该方法，初始化作用
  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
      navigatorKey: navigatorKey,
      //设置主题
      theme: ThemeData(
          accentColor: Colors.black,
          textSelectionColor: YcColors.colorWhite,
          primaryColor: YcColors.colorPrimary),

      //设置home
      home: new Scaffold(
        //设置appBar
        appBar: initAppBar(),
        //初始化侧滑菜单
        drawer: initDrawer(),//New
        //body主题内容
        body: indexStack,
        //相当于底部导航栏
        bottomNavigationBar: initNavigationBar(),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    initNavigationBarView();
    LogUtils.showPrint(TAG+'initState');
  }

  @override
  void didChangeDependencies() {
    LogUtils.showPrint(TAG+'didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    LogUtils.showPrint(TAG+'deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    LogUtils.showPrint(TAG+'dispose');
    super.dispose();
  }

  void _initCounter() {
    //setState方法的作用是通知Flutter框架，有状态发生了改变，Flutter框架收到通知后，
    //会执行build方法来根据新的状态重新构建界面， Flutter 对此方法做了优化，
    //使重新执行变的很快，所以你可以重新构建任何需要更新的东西，而无需分别去修改各个widget。
    setState(() {
      _counter++;
      LogUtils.showPrint(TAG+'setState');
    });
  }

  ///初始化数据
  void initData() {
    LogUtils.showPrint(TAG+'initData');
    indexStack = new IndexedStack(
      children: <Widget>[new HomePage(), new FindPage(),new TodoPage(), new MePage()],
      index: positionIndex,
    );
  }

  ///设置appBar
  AppBar initAppBar(){
    return new AppBar(
      //title
      title: new Text(
        mainTitles[positionIndex],
        style: new TextStyle(color: Colors.white , fontSize: 18 , fontWeight: FontWeight.bold),
      ),
      //这个相当于actionBar上的menu
      actions: <Widget>[
        new IconButton(
            icon: new Icon(Icons.account_balance),
            onPressed: () {
              navigatorKey.currentState.push(new MaterialPageRoute(builder: (context) {
                return new SearchPage(null);
              }));
            }),
        new IconButton(
            icon: new Icon(Icons.search),
            onPressed: () {
              navigatorKey.currentState.push(new MaterialPageRoute(builder: (context) {
                return new SearchPage(null);
              }));
            }),
        new IconButton(
            icon: new Icon(Icons.settings),
            onPressed: () {
              LogUtils.showPrint("点击设置按钮，跳转设置中心");
              //不要用下面这个，这个点击事件会报错
              //报错日志：Another exception was thrown: Navigator operation requested with a context that does not include a Navigator.
              //后期在研究原理
              /*Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                      return new SettingPage();
                    }));*/
              navigatorKey.currentState.push(new MaterialPageRoute(builder: (context) {
                return new SettingPage();
              }));
            }),
      ],
    );
  }

  ///初始化侧滑菜单控件
  SmartDrawer initDrawer() {
    return new SmartDrawer(
      widthPercent: 0.7,
      elevation: 12,
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("杨充"+_counter.toString()),
            accountEmail: Text("yangchong211@163.com"),
            onDetailsPressed: (){
              navigatorKey.currentState.push(new MaterialPageRoute(builder: (context) {
                return new AboutMePage();
              }));
            },
            currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                backgroundImage: new ExactAssetImage("lib/image/ic_person.jpg"),
              ),
              onTap: (){
                navigatorKey.currentState.push(new MaterialPageRoute(builder: (context) {
                  return new AboutMePage();
                }));
              },
            ),
          ),
          new ListTile(
              title: new Text("我的收藏"),
              trailing: new Icon(Icons.email),
              onTap: (){

              }
          ),
          new Divider(),
          new ListTile(
              title: new Text("GitHub客户端"),
              trailing: new Icon(Icons.email),
              onTap: (){

              }
          ),
          new Divider(),
          new ListTile(
              title: new Text("消息中心"),
              trailing: new Icon(Icons.verified_user),
              onTap: (){
              }
          ),
          new Divider(),
          new ListTile(
              title: new Text("提交项目"),
              trailing: new Icon(Icons.present_to_all),
              onTap: (){
              }
          ),
          new Divider(),
          new ListTile(
              title: new Text("分组管理"),
              trailing: new Icon(Icons.group_work),
              onTap: (){
              }
          ),
          new Divider(),
          new ListTile(
            title: new Text("关于项目"),
            trailing: new Icon(Icons.apps),
            onTap: (){
              navigatorKey.currentState.push(new MaterialPageRoute(builder: (context){
                return new AboutMePage();
              }));
            },
          ),
          new Divider(),
          new ListTile(
              title: new Text("设置中心"),
              trailing: new Icon(Icons.settings),
              onTap: (){
                LogUtils.showPrint("设置中心");
                /*Navigator.of(context).push(new MaterialPageRoute(builder: (context){
                  return new SettingPage();
                }));*/
                _initCounter();
                //关闭侧滑菜单
                navigatorKey.currentState.push(new MaterialPageRoute(builder: (context) {
                  return new SettingPage();
                }));
                //模拟发送通知
                EventBus.internal().on(Constants.busSetting,(arg) {
                  // do something
                  LogUtils.showPrint("发送消息通知，设置");
                });
              }
          ),
          new Divider(),
        ],
      ),
    );
  }

  ///相当于底部导航栏
  BottomNavigationBar initNavigationBar(){
    return new BottomNavigationBar(
      items: navigationViews.map((BottomNavigationBarItem navigationView) => navigationView).toList(),
      currentIndex: positionIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          positionIndex = index;
        });
      },
    );
  }

  void initNavigationBarView() {
    navigationViews = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        title: new Text(mainTitles[0]),
        backgroundColor: Colors.black,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.assignment),
        title: new Text(mainTitles[1]),
        backgroundColor: Colors.black,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.devices_other),
        title: new Text(mainTitles[2]),
        backgroundColor: Colors.black,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        title: new Text(mainTitles[3]),
        backgroundColor: Colors.black,
      ),
    ];
  }

}


