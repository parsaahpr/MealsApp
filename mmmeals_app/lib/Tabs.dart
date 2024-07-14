import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mmmeals_app/categorie.dart';
// import 'package:mmmeals_app/dummy_data.dart';
import 'package:mmmeals_app/filters.dart';
import 'package:mmmeals_app/main_Drawer.dart';
import 'package:mmmeals_app/meals.dart';
import 'package:mmmeals_app/provider/favorites_provider.dart';
import 'package:mmmeals_app/provider/filters_provider.dart';
import 'package:mmmeals_app/provider/meals_provider.dart';

const KInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  void _selectPage(int k) {
    setState(() {
      _selectedPageIndex = k;
    });
  }

  // final List<Meal> favoriteMeals = [];
  // Map<Filter, bool> _selectedfilters = KInitialFilters;

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = favoriteMeals.contains(meal);

  //   if (isExisting == true) {
  //     setState(() {
  //       favoriteMeals.remove(meal);
  //       _showInfoMessage('meal in not a favorite');
  //     });
  //   } else {
  //     setState(() {
  //       favoriteMeals.add(meal);
  //       _showInfoMessage('Marked as a favorite');
  //     });
  //   }
  // }

  void _setScreen(String identifier) async {
    if (identifier == "Filters") {
      Navigator.of(context).pop();
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FiltersScreen(),
        ),
      );
      // setState(() {
      //   _selectedfilters = result ?? KInitialFilters;
      // });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filtersProvider);
    final availableMeals = meals.where((meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    var activePageTitle = "Categories";
    Widget activePage = CategoriesScreen(
      // onToggleFavorite: _toggleMealFavoriteStatus,
      availableMeals: availableMeals,
    );

    if (_selectedPageIndex == 1) {
      final FavoriteMeals = ref.watch(FavoriteMealsProvider);
      activePage = MealsScreen(
        // onToggleFavorite: _toggleMealFavoriteStatus,
        meals: FavoriteMeals,
        title: 'favorities',
      );
      activePageTitle = 'your favoritie';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectt: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorities"),
        ],
      ),
    );
  }
}
