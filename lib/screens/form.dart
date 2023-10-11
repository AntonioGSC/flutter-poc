import 'package:flutter/material.dart';
import 'package:widgets_states_routes/models/language.dart';

class LanguageFormWidget extends StatelessWidget {
  LanguageFormWidget({super.key});

  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nomeController = TextEditingController();
  final _descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Nova Linguagem"),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Id", labelText: "Id"),
                      controller: _idController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Id inválido";
                        }
                        return null;
                      }),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Nome", labelText: "Nome"),
                      controller: _nomeController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Nome inválido";
                        }
                        return null;
                      }),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Descrição", labelText: "Descrição"),
                      controller: _descricaoController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Descrição inválida";
                        }
                        return null;
                      }),
                  Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final language = Language(
                                  int.parse(_idController.text),
                                  _nomeController.text,
                                  _descricaoController.text);

                              Navigator.pop(context, language);
                            }
                          },
                          child: const Text("Salvar"))),
                ],
              )),
        ));
  }
}
