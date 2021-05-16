import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/screens/homepage/homepage.dart';
import 'package:news/screens/UserProfile/userprofile.dart';
import 'package:news/screens/video/video.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations(
       [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'News 24',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
                debugShowCheckedModeBanner: false,

      home: HomePage(),
      routes: {
        HomePage.routename:(ctx)=>HomePage(),
        UserProfile.routename:(ctx)=>UserProfile(),
        VideoPage.routename:(ctx)=>VideoPage(),
      },
    );
  }
}

