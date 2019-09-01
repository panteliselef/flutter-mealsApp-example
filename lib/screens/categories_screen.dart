import 'package:deli_meals/widgets/category_item.dart';
import 'package:flutter/material.dart';

import 'package:deli_meals/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: DUMMY_CATEGORIES
          .map((catDate) =>
              CategoryItem(catDate.id, catDate.title, catDate.color))
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}
