import 'package:flutter/material.dart';
import 'package:widgets_app/images.dart';
import 'package:widgets_app/planet.dart';
import 'package:widgets_app/planet_card.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var planet = ModalRoute.of(context)?.settings.arguments as Planet;
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
              PlanetCard(
                planet: planet,
                onPressed: (_) {},
              )
            ],
          )),
    );
  }
}
