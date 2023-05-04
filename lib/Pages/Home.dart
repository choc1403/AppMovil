import 'package:apptaller/Common/MyRouters.dart';
import 'package:apptaller/Model/nota.dart';
import 'package:apptaller/Pages/Pages.dart';
import 'package:apptaller/services/appstate.dart';
import 'package:apptaller/services/userservies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../values/thema.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Notas App",
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ROUTE_NOTA);
          /*showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return ModalNota();
              });*/
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: estado!.obtenerNotas(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          List misnotas = snapshot.data ?? [];
          return ListView(
            children: [
              for (Nota nota in misnotas)
                ListTile(
                  title: Text(
                    nota.titulo,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(nota.contenido),
                  trailing: IconButton(
                    onPressed: () {
                      estado!.deleteNota(nota.key);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Nota Eliminada Correctamente'),
                        backgroundColor: Colors.green,
                      ));
                    },
                    icon: Icon(Icons.delete_outline, color: Colors.red),
                  ),
                ),
            ],
          );
        },
      ),
      /*ListView(
        
      ),*/
    );
  }
}
