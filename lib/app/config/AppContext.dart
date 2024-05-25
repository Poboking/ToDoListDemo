import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:youtube_course_demo/app/utils/system/app_setting.dart';

class AppContext {
  final String boxName = "box";

  Future init() async {
    //init flutter app
    WidgetsFlutterBinding.ensureInitialized();

    //get the logger
    final Logger logger = Logger();

    //get application directory
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    logger.i("The Application Main Path: ${appDirectory.path}");
    if (appDirectory.path == "") {
      exitApp();
    }

    //init flutter hive
    await Hive.initFlutter(appDirectory.path);
    await Hive.openBox(boxName);

    // init android navigation bar
    if (Platform.isAndroid) {
      //设置Android头部的导航栏透明
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, //全局设置透明
          statusBarIconBrightness: Brightness.light
        //light:黑色图标 dark：白色图标
        //在此处设置statusBarIconBrightness为全局设置
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    return Future.value();
  }
}
