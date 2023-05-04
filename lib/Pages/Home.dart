import 'package:apptaller/Common/MyRouters.dart';
import 'package:apptaller/Model/nota.dart';
import 'package:apptaller/Pages/Pages.dart';
import 'package:apptaller/services/appstate.dart';
import 'package:apptaller/services/userservies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apptaller/Widgets/widgets.dart';
import '../values/thema.dart';

/*
  En este apartado listamos todas las notas que tenemos almacendo en la
  base de datos. En este apartado es la forma visual

*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppState? estado;
  @override
  Widget build(BuildContext context) {
    this.estado = Provider.of<AppState>(context, listen: true);
    return Scaffold(
      appBar: MyAppBarHome(),
      drawer: MyDrawer(),
      body: MyCardHome(estado),
    );
  }
}
