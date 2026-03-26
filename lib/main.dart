import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_web/Pages/landing_page.dart';
import 'package:portfolio_web/Pages/services_page.dart';

void main() {
  usePathUrlStrategy();
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
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const PortfolioPage());
      },
      routes: {
        '/': (context) => const PortfolioPage(),
        '/services': (context) => const ServicesPage(),
      },
    );
  }
}
