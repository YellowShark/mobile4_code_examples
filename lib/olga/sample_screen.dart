import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widgets_app/olga/university.dart';
import 'package:widgets_app/olga/university_card.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({Key? key}) : super(key: key);

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {
  List<University> _list = [];
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('query', _controller.text);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _controller,
            onChanged: (text) {
              if (text.length > 2) {
                _getUniversities(text);
              }
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (ctx, i) => UniversityCard(
                university: _list[i],
                onTap: (url) async => await launchUrl(Uri.parse(url)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _getUniversities([String country = 'United+States']) async {
    const baseUrl = 'http://universities.hipolabs.com';
    const method = '/search';
    final parameters = '?country=$country';
    final response = await http.get(Uri.parse('$baseUrl$method$parameters'));
    print(response.statusCode);
    print(response.body);
    final data = jsonDecode(response.body) as List;
    final universities = data.map((e) => University.fromJson(e)).toList();
    print(universities.toString());
    setState(() {
      _list = universities;
    });
  }

  void _init() async {
    final prefs = await SharedPreferences.getInstance();
    final query = prefs.getString('query') ?? '';
    print(query);
    _controller.text = query;
    _getUniversities(query);
  }
}

/*
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

void main() => runApp(
      const MaterialApp(
        home: Material(
          child: Center(
            child: RaisedButton(
              onPressed: _launchUrl,
              child: Text('Show Flutter homepage'),
            ),
          ),
        ),
      ),
    );

void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
 */
