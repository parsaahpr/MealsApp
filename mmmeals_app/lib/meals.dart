// import 'dart:js';

import 'package:flutter/material.dart';
// import 'package:mmmeals_app/detail.dart';
import 'package:mmmeals_app/meal_item.dart';
// import 'detail.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    required this.title,
    // required this.onToggleFavorite,
    // required this.favory
  });
  // final void Function(Meal meal) onToggleFavorite;
  final String? title;
  final List<Meal> meals;
  // final List<Meal> favory;
  // final Meal meal;
  // void selectMeal(BuildContext context, Meal meal) {
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => MealDeatilsScreen(meal: meal),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    TextStyle rang = Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(color: Theme.of(context).colorScheme.onTertiary);
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          return MealItem(
            // onTopggleFavorite: onToggleFavorite,
            meal: meals[index],
            // onSelectMeal: (meal, context) {
            // selectMeal(meal, context);
            // },
            // onSelectMeal: (meal, context)

            // selectMeal(context, meal);
          );
        });

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'no nothing here',
              style: rang,
            ),
            SizedBox(
              height: 20,
            ),
            Text('try selecting a diffrent category', style: rang)
          ],
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}

enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
}
