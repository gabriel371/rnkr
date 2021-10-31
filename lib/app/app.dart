import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'rnkr',
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: Colors.blueGrey[600],
        scaffoldBackgroundColor: Colors.blueGrey[800],
        shadowColor: Colors.black,
        cardColor: Colors.blueGrey,
        canvasColor: Colors.white12,
        errorColor: Colors.red,
        dialogBackgroundColor: Colors.blueGrey[700],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
        ),
      ),
      theme: ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: Colors.grey[400],
        scaffoldBackgroundColor: Colors.grey[200],
        shadowColor: Colors.grey[600],
        cardColor: Colors.grey[300],
        canvasColor: Colors.white12,
        errorColor: Colors.red,
        dialogBackgroundColor: Colors.grey[100],
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
          headline1: TextStyle(color: Colors.black),
          headline2: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}
