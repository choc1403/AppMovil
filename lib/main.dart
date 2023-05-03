import 'package:apptaller/values/thema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:apptaller/Pages/Pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notas App',
      debugShowCheckedModeBanner: false,
      theme: miTema(context),
      home: MyHomePage(),
    );
  }
}
