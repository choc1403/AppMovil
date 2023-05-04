/**
 * El modelo de la base de datos a utilizar
 */

class Nota {
  Nota({required this.contenido, required this.key, required this.titulo});
  String key;
  String titulo;
  String contenido;

  String get get_key {
    return key;
  }

  set set_key(String pk) {
    key = pk;
  }

  String get get_titulo {
    return titulo;
  }

  set set_titulo(String title) {
    titulo = title;
  }

  String get get_contenido {
    return contenido;
  }

  set set_contenido(String content) {
    contenido = content;
  }
}
