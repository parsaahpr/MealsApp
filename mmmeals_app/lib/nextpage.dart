import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mmmeals_app/meals.dart';

class MealDeatilsScreen extends StatelessWidget {
  MealDeatilsScreen({super.key, required this.meal});
  final Meal meal;

  // nextPage(context){  Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => MealDeatilsScreen(meal: meal),
  //     ),
  //   );}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // ElevatedButton(onPressed: () {}, child: Text('hello')),
          Scaffold(
            body: Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            appBar: AppBar(
              title: Text(meal.title),
            ),
          ),
        ],
      ),
    );
  }
}
