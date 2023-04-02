// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:marvelapi/pages/traerPersonajes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red1,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: MainApiMarvel(),
    );
  }
}

class MainApiMarvel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _mainApiMarvel();
  }
}

class _mainApiMarvel extends State<MainApiMarvel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("MARVEL"),
        ),
        body: listaPersonajes());
  }
}
