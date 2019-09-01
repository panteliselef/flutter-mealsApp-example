import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/widgets/meal_item.dart';
import 'package:flutter/material.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavoritesScreen(this.favoriteMeals);


  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return Center(child: Text('You have no favorites yet'));
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final categoryMeal = favoriteMeals[index];
          return MealItem(
            title: categoryMeal.title,
            id: categoryMeal.id,
            imageUrl: categoryMeal.imageUrl,
            complexity: categoryMeal.complexity,
            affordability: categoryMeal.affordability,
            duration: categoryMeal.duration,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
