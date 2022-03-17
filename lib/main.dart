import 'package:flutter/material.dart';
import 'package:movie_tv/presentation/ui/widget/splash_screen_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie TV',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenWidget(),
    );
  }
}
