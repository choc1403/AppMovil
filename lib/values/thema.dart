import 'package:flutter/material.dart';

const Color primary = Color(0xff272838);
const Color secundary = Color(0xff7E7F9A);
const Color blanco = Color(0xffF9F8F8);
const Color amarillo = Color(0xffF3FE8A);
const Color rojo = Color(0xffEB9486);

miTema(BuildContext context) {
  return ThemeData(
    primarySwatch: Colors.blueGrey,
    colorScheme: ColorScheme.fromSwatch(
      primaryColorDark: Colors.yellow,
    ).copyWith(
      secondary: Colors.amber,
    ),
  );
}
