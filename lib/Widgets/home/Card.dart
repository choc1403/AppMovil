import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apptaller/Model/nota.dart';

class MyCardHome extends StatelessWidget {
  var estado;
  MyCardHome(this.estado);
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(
          color: Colors.black12,
          width: 2,
        ),
      ),
      child: FutureBuilder(
        future: estado!.obtenerNotas(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          List misnotas = snapshot.data ?? [];
          return ListView(
            children: [
              for (Nota nota in misnotas)
                Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      nota.titulo,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(nota.contenido),
                    onTap: () {
                      print("aaal " + nota.key);
                    },
                    trailing: IconButton(
                      onPressed: () {
                        estado!.deleteNota(nota.key);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Nota Eliminada Correctamente'),
                          backgroundColor: Colors.green,
                        ));
                      },
                      icon: Icon(Icons.delete_outline, color: Colors.red),
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
