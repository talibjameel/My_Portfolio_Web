import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talib | Portfolio',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFF0B1324),
        brightness: Brightness.dark,
      ),
      home: const PortfolioPage(),
    );
  }
}






