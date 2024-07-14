import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mmmeals_app/provider/filters_provider.dart';
// import 'package:mmmeals_app/Tabs.dart';
// import 'package:mmmeals_app/main_Drawer.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  FiltersScreen({
    super.key,
    // required this.CurrentFilters
  });
  // final Map<Filter, bool> CurrentFilters;
  @override
  ConsumerState<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends ConsumerState<FiltersScreen> {
  var _veganfreeFilterset = false;
  var _vegetarianfreeFilterset = false;
  var _lactosefreeFilterset = false;
  var _glutinfreeFilterset = false;

  @override
  void initState() {
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutinfreeFilterset = activeFilters[Filter.glutenFree]!;
    _vegetarianfreeFilterset = activeFilters[Filter.vegetarian]!;
    _lactosefreeFilterset = activeFilters[Filter.lactoseFree]!;
    _veganfreeFilterset = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(onSelectt: (a) {
      //   Navigator.of(context).pop();
      //   if (a == 'Meals') {
      //     Navigator.of(context)
      //         .push(MaterialPageRoute(builder: (context) => TabsScreen()));
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutinfreeFilterset,
            Filter.lactoseFree: _lactosefreeFilterset,
            Filter.vegetarian: _vegetarianfreeFilterset,
            Filter.vegan: _veganfreeFilterset
          });
          // Navigator.of(context).pop();
          return true;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutinfreeFilterset,
              onChanged: (value) {
                setState(() {
                  _glutinfreeFilterset = value;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                "Only Include gluten-free meals",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Colors.amber,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactosefreeFilterset,
              onChanged: (newValue) {
                setState(() {
                  _lactosefreeFilterset = newValue;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                "Only Include Lactose-free meals",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Colors.amber,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianfreeFilterset,
              onChanged: (newValue) {
                setState(() {
                  _vegetarianfreeFilterset = newValue;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                "Only Vegetarian meals",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Colors.amber,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganfreeFilterset,
              onChanged: (newValue) {
                setState(() {
                  _veganfreeFilterset = newValue;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
              ),
              subtitle: Text(
                "Only vegan meals",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
              activeColor: Colors.amber,
              contentPadding: EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('your filters'),
      ),
    );
  }
}
