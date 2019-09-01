import 'package:flutter/material.dart';
import 'package:deli_meals/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavorite, this.isFavorite);
  Widget _buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text,
          style:
              Theme.of(context).textTheme.title.copyWith(color: Colors.black)),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 300,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);

    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover),
              ),
              _buildSectionTitle(context, 'Ingredients'),
              _buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
                ),
              ),
              _buildSectionTitle(context, 'Steps'),
              _buildContainer(
                ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (ctx, index) => Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: ()=>toggleFavorite(mealId),
      ),
    );
  }
}
