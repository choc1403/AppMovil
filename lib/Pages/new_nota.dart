import 'package:apptaller/services/appstate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:apptaller/services/userservies.dart';
import 'package:apptaller/values/thema.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Nueva Nota",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        elevation: 10,
        toolbarHeight: 65,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: blanco,
        child: Form(
          key: _formularioKey,
          child: SingleChildScrollView(
              child: Column(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: InputDecoration(
                  labelText: 'Titulo de la nota',
                ),
                validator: (String? dato) {
                  if (dato!.isEmpty) {
                    return 'Este Campo es requerido';
                  }
                },
              ),
              TextFormField(
                controller: _contenidoController,
                decoration: InputDecoration(
                  labelText: 'Contenido',
                ),
                maxLines: 10,
                validator: (String? dato) {
                  if (dato!.isEmpty) {
                    return 'Este Campo es requerido';
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        print("Esta presionando");
                        if (_formularioKey.currentState!.validate()) {
                          print("Formulario correcto");

                          bool respuesta = await Provider.of<AppState>(context,
                                  listen: false)
                              .saveNotas(_tituloController.text,
                                  _contenidoController.text);

                          /*await UserServices().saveNotas(
                              _tituloController.text,
                              _contenidoController.text);*/

                          print("El resultado del await $respuesta");

                          if (respuesta) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Nota Agregada Correctamente'),
                              backgroundColor: Colors.green,
                            ));
                          } else {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Fallo'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }
                      },
                      child: Text('Aceptar')),
                  SizedBox(width: 10),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancelar')),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _contenidoController.dispose();
    _tituloController.dispose();
    super.dispose();
  }
}
