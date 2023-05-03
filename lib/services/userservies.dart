import 'package:apptaller/Model/nota.dart';
import 'package:firebase_database/firebase_database.dart';

class UserServices {
  Future<List<Nota>> getNotas() async {
    List<Nota> misNotas = [];
    try {
      DataSnapshot snap = (await FirebaseDatabase.instance
          .ref()
          .child('appNotas')
          .once()) as DataSnapshot;
      if (snap.exists) {
        print(snap.value);
      }

      return misNotas;
    } catch (e) {
      return misNotas;
    }
  }

  Future<bool> saveNotas(String titulo, String contenido) async {
    try {
      await FirebaseDatabase.instance
          .ref()
          .child('appNotas')
          .push()
          .set({'title': titulo, 'body': contenido});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}