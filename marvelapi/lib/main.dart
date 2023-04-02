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
        title: const Text("APP Santiago Osorio"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: Colors.red1,
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(children: const [
              Text(
                'MARVEL',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ]),
          ),
          SizedBox(height: 30),
          Card(
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Column(children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Text(
                  'Marvel es una compañía de entretenimiento que produce películas, series, cómics y mucho más.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ]),
          ),
          SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TraerPersonajes()),
              );
            },
            child: Text('Ver personajes'),
          ),
        ],
      ),
    );
  }
}
