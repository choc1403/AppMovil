import 'dart:convert';

import 'package:apptaller/DataBase/DataBase.dart';
import 'package:apptaller/Model/nota.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

/**
 * Modulo que sirve para realizar el CRUD de la aplicacion
 */

class UserServices {
  Future<bool> eliminarNota(String key) async {
    try {
      await DataBase.database.child(key).remove();
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Nota>> getNotas() async {
    List<Nota> misNotas = [];

    try {
      DataSnapshot snapshot = await DataBase.database.get();
      if (snapshot.exists) {
        snapshot.children.forEach((dato) {
          var body = dato.child('body').value.toString();
          var title = dato.child('title').value.toString();
          Map mapa = {'key': dato.key, 'title': title, 'body': body};
          Nota nuevaNo = Nota(
              contenido: mapa['body'], titulo: mapa['title'], key: mapa['key']);
          misNotas.add(nuevaNo);
        });
      }

      return misNotas;
    } catch (e) {
      return misNotas;
    }
  }

  Future<bool> saveNotas(String titulo, String contenido) async {
    try {
      print("Guardandooo");
      await DataBase.database.push().set({'title': titulo, 'body': contenido});
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}
