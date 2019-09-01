import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  bool _loadedInitData = false;

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => mealId == meal.id);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            final categoryMeal = displayedMeals[index];
            return MealItem(
              title: categoryMeal.title,
              id: categoryMeal.id,
              imageUrl: categoryMeal.imageUrl,
              complexity: categoryMeal.complexity,
              affordability: categoryMeal.affordability,
              duration: categoryMeal.duration,
            );
          },
          itemCount: displayedMeals.length,
        ),
    );
  }
}
