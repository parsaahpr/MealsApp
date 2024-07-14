// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:mmmeals_app/Category.dart';
import 'package:mmmeals_app/dummy_data.dart';
// import 'package:mmmeals_app/meals.dart';

class Categorygriditem extends StatelessWidget {
  const Categorygriditem({
    required this.cattegory,
    required this.onselectcategory,
    super.key,
  });

  final Category cattegory;
  final void Function() onselectcategory;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onselectcategory,
      splashColor: const Color.fromARGB(0, 0, 0, 0),
      borderRadius: BorderRadius.circular(18),
      child: Container(
        margin: EdgeInsets.all(8),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(colors: [
              cattegory.color.withOpacity(0.2),
              cattegory.color.withOpacity(0.8)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Text(
          cattegory.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
