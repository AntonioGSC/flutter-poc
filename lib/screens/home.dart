import 'package:flutter/material.dart';
import 'package:widgets_states_routes/models/language.dart';

class HomeLanguagesWidget extends StatefulWidget {
  const HomeLanguagesWidget({super.key});

  @override
  State<HomeLanguagesWidget> createState() => _HomeLanguagesWidgetState();
}

class _HomeLanguagesWidgetState extends State<HomeLanguagesWidget> {
  final List _selecteds = [];

  // final List<Language> _selecteds = [
  //   Language(0, "Android Nativo", "Linguagens a, Java e Kotlin"),
  //   Language(1, "iOs Nativo", "Linguagens Objective-C, Swift"),
  //   Language(2, "Flutter", "Linguagem Dart"),
  //   Language(3, "React Native", "Linguagens Javascript e Typescript"),
  // ];

  // _setSelected(index, value) {
  //   setState(() {
  //     _selecteds[index].selected = value;
  //   });
  // }

  _setSelected(Language language) {
    setState(() {
      language.selected = !language.selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Minhas linguagens"),
            backgroundColor: Colors.blue,
            actions: [
              IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final future = Navigator.pushNamed(context, "/add");

                    future.then((language) {
                      setState(() {
                        _selecteds.add(language);
                      });
                    });
                  })
            ]),
        body: Column(
          children: [
            Center(
              child: Wrap(spacing: 10, children: _buildChoiceChips()),
            ),
            Expanded(child: ListView(children: _buildCards()))
          ],
        ));
  }

  List<Widget> _buildChoiceChips() {
    List<Widget> result = [];

    result = _selecteds
        .map((item) => ChoiceChip(
            label: Text(item.title),
            selected: item.selected,
            onSelected: (value) => _setSelected(item)))
        .toList();

    return result;
  }

  List<Widget> _buildCards() {
    List<Widget> result = [];

    result = _selecteds
        .where((item) => item.selected == true)
        .map((item) => Card(
                child: ListTile(
              leading: Text(item.id.toString()),
              title: Text(item.title),
              subtitle: Text(item.subtitle),
            )))
        .toList();

    return result;
  }
}
