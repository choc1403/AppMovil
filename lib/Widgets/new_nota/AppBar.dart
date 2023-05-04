import 'package:flutter/material.dart';

class MyAppBarNewNota extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Nueva Nota",
        style: TextStyle(fontSize: 25),
      ),
      centerTitle: true,
      elevation: 10, //Crea un sombreado al rededor del APPBAR

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(
                  25))), // Dandole un disñeo más amigable al appbar
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
