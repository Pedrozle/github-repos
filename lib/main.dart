import 'package:flutter/material.dart';
import 'package:github_repos/apps/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(65, 107, 171, 1)),
        scaffoldBackgroundColor: Color.fromARGB(255, 242, 242, 246),
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      home: Index(),
    );
  }
}
