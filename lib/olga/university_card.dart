import 'package:flutter/material.dart';
import 'package:widgets_app/olga/university.dart';

class UniversityCard extends StatelessWidget {
  final University university;
  final void Function(String url) onTap;

  const UniversityCard({
    Key? key,
    required this.university,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(university.name),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(university.country),
            ),
            GestureDetector(
              onTap: () => onTap(university.webPage),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  university.webPage,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
