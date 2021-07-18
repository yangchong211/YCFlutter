import 'package:flutter/material.dart';
import 'package:yc_flutter_utils/utils/flutter_init_utils.dart';
import 'package:yc_flutter_utils_example/main/main_app_page.dart';

void main() {
  //初始化工具类操作
  Future(() async {
    await FlutterInitUtils.fetchInitUtils();
  });
  //await FlutterInitUtils.fetchInitUtils();
  //FlutterInitUtils.fetchInitUtils();
  runApp(MainApp());
}
