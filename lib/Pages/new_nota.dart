import 'package:apptaller/Widgets/widgets.dart';
import 'package:apptaller/services/appstate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:apptaller/services/userservies.dart';
import 'package:apptaller/values/thema.dart';
import 'package:provider/provider.dart';

/**
 * En este Apartdo tenemos el formulario para crear una nueva nota
 */

class ModalNota extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ModalNotaState();
}

class _ModalNotaState extends State<ModalNota> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();

  final GlobalKey<FormState> _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: MyAppBarNewNota(),
      body: MyCardNewNota(
          _contenidoController, _formularioKey, _tituloController),
    );
  }

  @override
  void dispose() {
    _contenidoController.dispose();
    _tituloController.dispose();
    super.dispose();
  }
}
