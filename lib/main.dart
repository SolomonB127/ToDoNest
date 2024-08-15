import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_nest/Pages/home_page.dart';

void main() async {
  // Init Hive - Hive is used for storing small and medium size dataset
  await Hive.initFlutter();

  // Open hive box
  var box = await Hive.openBox('storage');

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
          primarySwatch: Colors.grey,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.grey),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.grey,
          )),
    );
  }
}
