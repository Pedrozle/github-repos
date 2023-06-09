import 'package:flutter/material.dart';
import 'package:github_repos/apps/index.dart';
import 'package:github_repos/constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Repos Github',
      theme: ThemeData(
          fontFamily: 'Montserrat',
          brightness: Brightness.light,
          primaryColor: const Color(ColorsEnum.primaryColor),
          scaffoldBackgroundColor: const Color(ColorsEnum.scaffoldColor)),
      home: Index(),
      debugShowCheckedModeBanner: false,
    );
  }
}
