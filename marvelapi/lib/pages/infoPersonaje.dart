import 'package:flutter/material.dart';
import 'package:marvelapi/controllers/personaje.dart';

// ignore: camel_case_types
class infoPersonaje extends StatelessWidget {
  final Character character;
  // Validación para cuando description sea nulo o esté vacío
  final defaultDescription = 'Este personaje no tiene descripción.';
  final defaultSeries = 'Este personaje no tiene series.';

  const infoPersonaje({Key? key, required this.character}) : super(key: key);

  Widget buildButton({
    required String text,
    required int value,
  }) =>
      MaterialButton(
        onPressed: () {},
        padding: const EdgeInsets.symmetric(vertical: 7),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              '$value',
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 2,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: const Text("Personaje:"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 59, 60, 60),
                border: Border.all(
                    width: 0, color: const Color.fromARGB(0, 218, 206, 206)),
              ),
              child: Text(
                character.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.network(
              character.image,
              height: 300,
              fit: BoxFit.cover,
            ),
            Container(
              height: 21,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 0, color: Colors.transparent),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 0, color: Colors.transparent),
              ),
              child: Text(
                character.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
            ),
            Container(
              height: 13,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 0, color: Colors.transparent),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 59, 60, 60),
                border: Border.all(width: 0, color: Colors.transparent),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      buildButton(text: "Comics", value: character.comicsCount),
                      buildButton(text: "Series", value: character.seriesCount),
                      buildButton(
                          text: "Histories", value: character.storiesCount),
                      buildButton(text: "Events", value: character.eventsCount),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    const Text(
                      'Tres primeras series: ',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    for (final seriesName in character.firstThreeSeriesNames)
                      Text(
                        seriesName,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
