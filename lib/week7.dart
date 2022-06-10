import 'package:flutter/material.dart';
import 'package:widgets_app/girl.dart';

void main() {
  runApp(const MyApp2());
}

class MyApp2 extends StatelessWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _girls = [
    Girl('Olga', 15),
    Girl('Olga', 30),
    Girl('Yulia', 30),
    Girl('Ekaterina', 30),
  ];

  late var _filteredList = _girls;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            onChanged: (query) {
              if (query.isEmpty) {
                setState(() {
                  _filteredList = _girls;
                });
                return;
              }
              setState(() {
                _filteredList = _girls.where((girl) => girl.name.contains(query)).toList();
              });
            },
          ),
          Expanded(
            child: ListView(
              children: _filteredList.map((girl) => ListTile(
                title: Text(girl.toString()),
              )).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

