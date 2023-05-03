import 'package:apptaller/Data/tables.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Db {
  String name = "DiaryApp";
  int version = 1;

  Future<Database> open() async {
    String path = join(await getDatabasesPath(), name);
    return openDatabase(path,
        version: version, onConfigure: onConfigure, onCreate: onCreate);
  }

  onCreate(Database db, int version) async {
    for (var script in tables) {
      await db.execute(script);
    }
  }

  onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON ");
  }
}
