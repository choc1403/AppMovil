import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Common/MyRouters.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/chat.png'),
            ),
            accountName: Text('Juan Carlos Choc Xol - 202041390'),
            accountEmail: Text('eloicx@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.pushNamed(
                  context, ROUTE_HOME); // Se dirige a la pagina de inicio
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text('Agregar Nueva Nota'),
            onTap: () {
              Navigator.pushNamed(context,
                  ROUTE_NOTA); //Se dirige a la pagina de crear nueva nota
            },
          ),
          Divider(
            height: 6,
            color: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.close),
            title: Text('Salir'),
            onTap: () {
              SystemNavigator.pop(); // Se por completo de la aplicacion
            },
          ),
        ],
      ),
    );
  }
}
