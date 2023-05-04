import 'package:apptaller/Common/MyRouters.dart';
import 'package:apptaller/services/appstate.dart';
import 'package:apptaller/values/thema.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:apptaller/Pages/Pages.dart';
import 'package:provider/provider.dart';

void main() async {
  // Inicializamos la Firebase a la aplicacion
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AppState(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        title: 'Notas App',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: MyRouters.generateRoute,
        initialRoute: ROUTE_HOME,
      ),
    );
  }
}
