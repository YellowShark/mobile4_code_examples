import 'package:flutter/material.dart';
import 'package:widgets_app/images.dart';
import 'package:widgets_app/main.dart';
import 'package:widgets_app/planet.dart';
import 'package:widgets_app/planet_card.dart';

// Homework 5 (Flutter)
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _planets = <String>{'sun'};

  @override
  Widget build(BuildContext context) {
    var a = A(1);
    a.b = 2;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bgSrc),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                onSubmitted: (text) {
                  setState(() {
                    _planets.add(
                      text,
                    );
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Planet name',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white, width: 2)),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: _planets.length,
                itemBuilder: (_, i) => PlanetCard(
                  planet: Planet(
                    colors: [Colors.white, Colors.black],
                    src: AppImages.sunSrc,
                    name: _planets.elementAt(i),
                    description: 'Lorem ipsum',
                  ),
                  onPressed: _onPlanetClick,
                ), separatorBuilder: (BuildContext context, int index) => Divider(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onButtonClick,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _onPlanetClick(Planet planet) {
    Navigator.pushNamed(
      context,
      '/details',
      arguments: planet,
    );
  }

  void _onButtonClick() {
    setState(
      () {
        _planets = _planets
          ..add(
            'Earth',
          );
      },
    );
  }
}
