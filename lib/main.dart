import 'package:flutter/material.dart';
import 'package:shadow/views/Home/HomeScreen.dart';
import 'package:shadow/views/register.dart';
import 'Global/Settings/template.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        register.rName: (context) => const register(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Shadow',
      theme: theme,
      home: HomeScreen(),
    );
  }
}
