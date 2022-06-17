import 'package:flutter/material.dart';
import 'package:widgets_app/week8/domain/model/recipe.dart';

class RecipeCard extends StatelessWidget {
  final void Function() onTap;
  final Recipe recipe;

  const RecipeCard({
    Key? key,
    required this.onTap,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.network(recipe.image),
          Text(recipe.title),
        ],
      ),
    );
  }
}
