import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        shadowColor: Colors.grey[900],
        cardColor: Colors.blueGrey,
        canvasColor: Colors.white12,
        errorColor: Colors.red,
        dialogBackgroundColor: Colors.blueGrey[700],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          bodyText1: GoogleFonts.lato(color: Colors.white),
          bodyText2: GoogleFonts.lato(color: Colors.white),
          headline1: GoogleFonts.lato(color: Colors.white),
          headline2: GoogleFonts.lato(color: Colors.white),
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
        textTheme: TextTheme(
          bodyText1: GoogleFonts.lato(color: Colors.black),
          bodyText2: GoogleFonts.lato(color: Colors.black),
          headline1: GoogleFonts.lato(color: Colors.black),
          headline2: GoogleFonts.lato(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}
