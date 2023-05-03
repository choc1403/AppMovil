import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:apptaller/services/userservies.dart';
import 'package:apptaller/values/thema.dart';

class ModalNota extends StatefulWidget {
  const ModalNota({Key? key}) : super(key: key);
  @override
  State<ModalNota> createState() => _ModalNotaState();
}

class _ModalNotaState extends State<ModalNota> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();

  final GlobalKey<FormState> _formularioKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //height: 300,
        color: blanco,
        child: Form(
            key: _formularioKey,
            child: SingleChildScrollView(
              child: Column(children: [
                TextFormField(
                  controller: _tituloController,
                  decoration: InputDecoration(labelText: 'Titulo de la nota'),
                  validator: (String? dato) {
                    if (dato!.isEmpty) {
                      return 'Este Campo es requerido';
                    }
                  },
                ),
                TextFormField(
                  controller: _contenidoController,
                  decoration: InputDecoration(labelText: 'Contenido'),
                  maxLines: 10,
                  validator: (String? dato) {
                    if (dato!.isEmpty) {
                      return 'Este Campo es requerido';
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formularioKey.currentState!.validate()) {
                          bool respuesta = await UserServices().saveNotas(
                              _tituloController.text,
                              _contenidoController.text);
                          print(respuesta);

                          if (respuesta) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Nota agregada correctamente'),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Algo Salio Mal'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      child: Text('Aceptar'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar'),
                    ),
                  ],
                )
              ]),
            )));
  }

  @override
  void dispose() {
    _contenidoController.dispose();
    _tituloController.dispose();
    super.dispose();
  }
}
