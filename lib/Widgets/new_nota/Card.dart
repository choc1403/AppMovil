import 'package:apptaller/Common/MyRouters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:apptaller/services/appstate.dart';
import 'package:apptaller/values/thema.dart';

class MyCardNewNota extends StatelessWidget {
  var _tituloController;
  var _contenidoController;

  var _formularioKey;

  MyCardNewNota(
      this._contenidoController, this._formularioKey, this._tituloController);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: Colors.black12,
            width: 2,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    // Apartado de boton de aceptar
                    ElevatedButton(
                        onPressed: () async {
                          print("Esta presionando");
                          if (_formularioKey.currentState!.validate()) {
                            print("Formulario correcto");

                            bool respuesta = await Provider.of<AppState>(
                                    context,
                                    listen: false)
                                .saveNotas(_tituloController.text,
                                    _contenidoController.text);

                            /*await UserServices().saveNotas(
                              _tituloController.text,
                              _contenidoController.text);*/

                            print("El resultado del await $respuesta");

                            if (respuesta) {
                              Navigator.popAndPushNamed(context,
                                  ROUTE_HOME); // Se dirige al Apartado de inicio
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Nota Agregada Correctamente'),
                                backgroundColor: Colors.green,
                              )); // Una notificacion que nos indica que la accion de guarda fue correcta
                            } else {
                              Navigator.popAndPushNamed(context,
                                  ROUTE_HOME); // Se dirige al Apartado de inicio
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Fallo'),
                                backgroundColor: Colors.red,
                              )); // Notifica que algo estuvo mal
                            }
                          }
                        },
                        child: Text('Aceptar')),
                    SizedBox(width: 10),
                    // Apartado del boton de cancelar
                    ElevatedButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, ROUTE_HOME);
                        },
                        child: Text('Cancelar')),
                  ],
                )
              ],
            )),
          ),
        ));
  }
}
