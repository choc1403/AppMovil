import 'package:apptaller/Model/nota.dart';
import 'package:apptaller/Pages/Pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/thema.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String diares = "";
  List<Nota> misNotas = [
    Nota(titulo: "Titulo 1", contenido: "Conendio de la nmota"),
    Nota(titulo: "Titulo 2", contenido: "Conendio de la nmota"),
    Nota(titulo: "Titulo 3", contenido: "Conendio de la nmota")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notas App")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ModalNota();
              });
        },
        child: Icon(Icons.add),
      ),
      body: ListView(
        children: [
          for (Nota nota in misNotas)
            ListTile(
              title: Text(nota.titulo!),
              subtitle: Text(nota.contenido!),
            ),
        ],
      ),
    );
  }
}
