import 'package:firebase_database/firebase_database.dart';

/**
 * Modulo que se conecta a la base de datos
 */

class DataBase {
  static DatabaseReference database =
      FirebaseDatabase.instance.ref().child("notas");
}
