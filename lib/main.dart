import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.yellow[700],
            centerTitle:true,
            titleTextStyle: TextStyle(color:Colors.white, fontWeight: FontWeight.w600, fontSize:25),
        ),
      ),
      home: const HomePage(),
    );
  }
}
