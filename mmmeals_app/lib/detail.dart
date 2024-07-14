import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mmmeals_app/meals.dart';
import 'package:mmmeals_app/provider/favorites_provider.dart';
// import 'Tabs.dart';

class MealDeatilsScreen extends ConsumerWidget {
  MealDeatilsScreen({
    super.key,
    required this.meal,
    // required this.onToggleFavorite,
  });
  final Meal meal;
  // final void Function(Meal meal) onToggleFavorite;

  nextPage(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDeatilsScreen(
          // onToggleFavorite: onToggleFavorite,
          // favoriteMeals: [],
          meal: meal,
        ),
      ),
    );
  }

  // final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(FavoriteMealsProvider).contains(meal);
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: meal.id,
                child: Image.network(
                  meal.imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text('Ingredients',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Color.fromARGB(255, 240, 225, 18))),
              SizedBox(
                height: 20,
              ),
              for (final ingredients in meal.ingredients) Text(ingredients),
              SizedBox(
                height: 20,
              ),
              Text('Steps',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Color.fromARGB(255, 240, 225, 18))),
              SizedBox(
                height: 20,
              ),
              for (final Steps in meal.steps) Text(Steps),
            ],
          ),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                ref
                    .read(FavoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(meal);
                // onToggleFavorite(meal);
                print('sabt shod');
              },
              icon: AnimatedSwitcher(
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavorite),
                ),
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: Tween(begin: 0.1, end: 0.2).animate(animation),
                  child: child,
                ),
                duration: Duration(milliseconds: 300),
              ),
            )
          ],
          title: Text(meal.title),
        ),
      ),
    );
  }
}
