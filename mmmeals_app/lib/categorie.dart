// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mmmeals_app/category_grid_item.dart';
import 'package:mmmeals_app/dummy_data.dart';
import 'package:mmmeals_app/meals.dart';
// import 'package:mmmeals_app/meals.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen(
      {super.key,
      // required this.onToggleFavorite,
      required this.availableMeals});
  // final void Function(Meal meal) onToggleFavorite;

  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
        .where((Meal) => Meal.categories.contains(category.id))
        .toList();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MealsScreen(
        // onToggleFavorite: onToggleFavorite,
        meals: filteredMeals,
        title: category.title,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        child: GridView(
          padding: EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.1),
          children: [
            for (final pparsa in availableCategories)
              Categorygriditem(
                cattegory: pparsa,
                onselectcategory: () {
                  _selectCategory(context, pparsa);
                },
              )
          ],
        ),
        builder: (context, re) => SlideTransition(
              position: Tween(
                begin: Offset(0, 0.1),
                end: Offset(0, 0),
              ).animate(CurvedAnimation(
                  parent: _animationController, curve: Curves.easeInOut)),
              child: re,
            )
        // Padding(
        //       padding:
        //           EdgeInsets.only(top: 100 - _animationController.value * 100),
        //       child: re,
        //     )

        );
  }
}
