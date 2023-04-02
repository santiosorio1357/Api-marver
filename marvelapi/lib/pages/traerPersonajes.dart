import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marvelapi/controllers/personaje.dart';
import 'package:marvelapi/pages/infoPersonaje.dart';

class TraerPersonajes extends StatefulWidget {
  const TraerPersonajes({super.key});
  @override
  comoEstadoTraerPersonajes createState() => comoEstadoTraerPersonajes();
}

// ignore: camel_case_types
class comoEstadoTraerPersonajes extends State<TraerPersonajes> {
  List<dynamic> characters = [];

  Future<void> getCharacters() async {
    const ts = '1357';
    const apiKey = '9f8e0be4a1e4cb5a940e68773a15f5e7';
    const hash = '8834baeaea72ef756e78e5bba0c37dbe';

    const url =
        'https://gateway.marvel.com:443/v1/public/characters?ts=$ts&apikey=$apiKey&hash=$hash';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        characters = jsonData['data']['results'];
      });
    } else {
      throw Exception('Failed to load characters');
    }
  }

  @override
  void initState() {
    super.initState();
    getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      body: Center(
        child: characters.isEmpty
            ? const CircularProgressIndicator()
            : ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: characters.length,
                itemBuilder: (context, index) {
                  final character = characters[index];
                  final thumbnail = character['thumbnail']['path'] +
                      '.' +
                      character['thumbnail']['extension'];
                  final name = character['name'];
                  return GestureDetector(
                    onTap: () {
                      guardarInfoPersonaje(index);
                    },
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(thumbnail),
                        ),
                        title: Text(name),
                        onTap: () {
                          guardarInfoPersonaje(index);
                        },
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void guardarInfoPersonaje(int index) {
    final character = characters[index];
    final name = character['name'];
    final thumbnail = character['thumbnail']['path'] +
        '.' +
        character['thumbnail']['extension'];
    final description = character['description'];
    // Validación para cuando description sea nulo o esté vacío
    const personajesSinDescripcion = 'Este personaje no tiene descripción.';
    final validarDescriocion = (description == null || description.isEmpty)
        ? personajesSinDescripcion
        : description;
    final comics = character['comics']['available'];
    final series = character['series']['available'];
    final stories = character['stories']['available'];
    final events = character['events']['available'];
    final List<dynamic> seriesList = character['series']['items'];
    final seriesCount = min(seriesList.length, 3); // Validación para seriesList
    final List<String> seriesNames = seriesList
        .sublist(0, seriesCount)
        .map((item) => item['name'].toString())
        .toList();
    final Character selectedCharacter = Character(
        name: name,
        image: thumbnail,
        thumbnail: thumbnail,
        description: validarDescriocion,
        comicsCount: comics,
        seriesCount: series,
        storiesCount: stories,
        eventsCount: events,
        firstThreeSeriesNames:
            seriesNames); 
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => detallesPersonajes(
                character: selectedCharacter,
              )),
    );
  }
}
