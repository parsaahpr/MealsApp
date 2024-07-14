import 'package:flutter/material.dart';
import 'package:mmmeals_app/detail.dart';
import 'package:mmmeals_app/meal_trait.dart';
import 'package:mmmeals_app/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  MealItem({
    super.key,
    required this.meal,
    // required this.onSelectMeal,
    // required this.onTopggleFavorite,
  });
  final Meal meal;
  // final void Function(Meal meal) onTopggleFavorite;
  String ComplexityText() {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String Affordabilitytext() {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  // final void Function(BuildContext context, Meal meal) onSelectMeal;

  gopage(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealDeatilsScreen(
          // onToggleFavorite: onTopggleFavorite,
          // favoriteMeals: [],
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: InkWell(
        onTap: () {
          // onSelectMeal(context, meal);
          gopage(context);
        },
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              meal.duration.toString(), Icons.lock_clock),
                          SizedBox(
                            width: 20,
                          ),
                          MealItemTrait(ComplexityText(), Icons.work),
                          SizedBox(
                            width: 20,
                          ),
                          MealItemTrait(Affordabilitytext(), Icons.money)

                          // MealItemTrait(
                          //     icon: Icons.schedule,
                          //     label: meal.duration.toString())
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
