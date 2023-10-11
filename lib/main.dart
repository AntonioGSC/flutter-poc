import 'package:flutter/material.dart';
import 'package:widgets_states_routes/screens/form.dart';
import 'package:widgets_states_routes/screens/home.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const HomeLanguagesWidget(),
        "/add": (context) => LanguageFormWidget(),
      },
      initialRoute: "/",
    );
  }
}
