
import 'package:flutter/material.dart';
import 'package:youtube_course_demo/app/config/AppContext.dart';
import 'package:youtube_course_demo/app/page/home_page.dart';

import 'app/page/setting_page.dart';


void main() {
  AppContext().init()
      .then((value)=>runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: const ColorScheme.light().copyWith(primary: Colors.yellow),
          primarySwatch: Colors.yellow
      ),
      routes: {
        "/homepage":(context)=>const HomePage(),
        "/settingpage":(context)=>const SettingPage(),
      },
      home: const HomePage(),
    );
  }
}
