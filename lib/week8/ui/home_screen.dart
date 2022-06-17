// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class RecipesScreen extends StatefulWidget {
//   const RecipesScreen({Key? key}) : super(key: key);
//
//   @override
//   State<RecipesScreen> createState() => _RecipesScreenState();
// }
//
// class _RecipesScreenState extends State<RecipesScreen> {
//   var data = <String>[];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Recipes'),
//       ),
//       body: ListView.builder(
//         itemBuilder: (_, i) => Image.network(data[i]),
//         itemCount: data.length,
//       ),
//     );
//   }
//
//   Future<void> _fetchData() async {
//     const key = 'd8984725e8224950a239ba8a2e1ecf47';
//     const url = 'https://api.spoonacular.com/recipes/complexSearch?apiKey=$key';
//     final request = Uri.parse(url);
//     var response = await http.get(request);
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');
//     final result = jsonDecode(response.body)['results'] as List<dynamic>;
//     setState((){
//       data = result.map((e) => e['image'].toString()).toList();
//     });
//   }
// }

// API key d8984725e8224950a239ba8a2e1ecf47
// url https://api.spoonacular.com/recipes/complexSearch

import 'package:flutter/material.dart';
import 'package:widgets_app/week8/data/interactors/default_recipe_interactor.dart';
import 'package:widgets_app/week8/domain/interactors/recipe_interactor.dart';
import 'package:widgets_app/week8/domain/model/recipe.dart';
import 'package:widgets_app/week8/ui/widgets/recipe_card.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({Key? key}) : super(key: key);

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  final RecipeInteractor _interactor = DefaultRecipeInteractor();
  var data = <Recipe>[];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: ListView.builder(
        itemBuilder: (_, i) => RecipeCard(
          recipe: data[i],
          onTap: () {
            print('Hello');
          },
        ),
        itemCount: data.length,
      ),
    );
  }

  Future<void> _fetchData() async {
    final result = await _interactor.getRecipes();
    setState(() => data = result);
  }
}
