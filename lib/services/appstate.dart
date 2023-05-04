import 'package:apptaller/Model/nota.dart';
import 'package:apptaller/services/userservies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Obtener el resultado del CRUD realizado
 */
class AppState with ChangeNotifier {
  List<Nota> _notas = [];

  Future<void> deleteNota(String key) async {
    try {
      bool respues = await UserServices().eliminarNota(key);
      if (respues) {
        notifyListeners(); // Funcion que hace que se recarge automaticamente la aplicacion y muestre los resultados de la accion realizada
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> saveNotas(String text, String text2) async {
    try {
      bool resp = await UserServices().saveNotas(text, text2);
      if (resp) {
        notifyListeners(); // Funcion que hace que se recarge automaticamente la aplicacion y muestre los resultados de la accion realizada
      }
      return resp;
    } catch (e) {
      return false;
    }
  }

  Future<List<Nota>> obtenerNotas() async {
    try {
      _notas = await UserServices().getNotas();

      return _notas;
    } catch (e) {
      return _notas;
    }
  }
}
