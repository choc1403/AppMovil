import 'package:apptaller/Model/nota.dart';
import 'package:apptaller/Pages/Pages.dart';
import 'package:apptaller/services/userservies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../values/thema.dart';

class MyHomePage extends StatelessWidget {
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
          Navigator.pushNamed(context, 'nuevo');
          /*showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ModalNota();
              });*/
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: UserServices().getNotas(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          List misnotas = snapshot.data ?? [];
          return ListView(
            children: [
              for (Nota nota in misNotas)
                ListTile(
                  title: Text(nota.titulo!),
                  subtitle: Text(nota.contenido!),
                ),
            ],
          );
        },
      ),
    );
  }
}
