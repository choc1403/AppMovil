import 'package:firebase_database/firebase_database.dart';

class DataBase {
  static DatabaseReference database =
      FirebaseDatabase.instance.ref().child("notas");
}
