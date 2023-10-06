import 'package:flutter/material.dart';

class HomeLanguagesWidget extends StatefulWidget {
  const HomeLanguagesWidget({super.key});

  @override
  State<HomeLanguagesWidget> createState() => _HomeLanguagesWidgetState();
}

class _HomeLanguagesWidgetState extends State<HomeLanguagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minhas linguagens"),
      ),
    );
  }
}
