

import 'package:flutter/material.dart';
import 'package:ycflutter/gank/weight/SizableDrawer.dart';

class GankDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _GankDrawerState();
  }
}

class _GankDrawerState extends State<GankDrawer>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizableDrawer(
      widthPercent: 0.6,
      child: Column(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text("杨充"),
            accountEmail: Text("yangchong211@163.com"),
            onDetailsPressed: (){

            },
            currentAccountPicture: new GestureDetector(
              child: new CircleAvatar(
                backgroundImage: new ExactAssetImage("lib/image/ic_person.jpg"),
              ),
              onTap: (){

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

            },
          ),
          new Divider(),
          new ListTile(
              title: new Text("设置中心"),
              trailing: new Icon(Icons.settings),
              onTap: (){

              }
          ),
          new Divider(),
        ],
      ),
    );
  }



}

