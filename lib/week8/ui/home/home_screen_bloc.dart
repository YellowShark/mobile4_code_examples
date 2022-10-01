import 'package:flutter/material.dart';
import 'package:widgets_app/week8/ui/home/home_bloc.dart';
import 'package:widgets_app/week8/ui/widgets/recipe_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesScreenWithBloc extends StatefulWidget {
  const RecipesScreenWithBloc({Key? key}) : super(key: key);

  @override
  State<RecipesScreenWithBloc> createState() => _RecipesScreenWithBlocState();
}

class _RecipesScreenWithBlocState extends State<RecipesScreenWithBloc> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: _content(),
    );
  }

  Widget _content() => Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (ctx, state) {
          if (state is LoadedRecipesHomeState) {
            return ListView.builder(
              itemBuilder: (_, i) => RecipeCard(
                recipe: state.recipes[i],
              ),
              itemCount: state.recipes.length,
            );
          } else {
            ctx.read<HomeCubit>().fetchData();
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
}
