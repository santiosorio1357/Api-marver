// ignore_for_file: camel_case_types, use_key_in_widget_constructors, prefer_const_constructors

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
      debugShowCheckedModeBanner: false,
      title: 'Api marvel',
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
        title: const Text("APP Santiago Osorio"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 75, // Establece la altura del contenedor
            width: 250, // Establece el ancho del contenedor
            child: Card(
              color: Colors.red1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'MARVEL',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 150),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Text(
              'Marvel es una compañía de entretenimiento que produce películas, series, cómics y mucho más.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          SizedBox(height: 150),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TraerPersonajes()),
              );
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.grey), // Establece el color de fondo del botón en azul
            ),
            child: Text(
              'Ver personajes',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
