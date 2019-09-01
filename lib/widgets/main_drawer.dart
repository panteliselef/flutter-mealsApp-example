import 'package:deli_meals/screens/filters_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(

        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).accentColor,
              child: Text(
                'Cooking Up',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor,
                    fontSize: 30),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _buildListTile('Meals', Icons.restaurant, () {
              print("NIce");
              Navigator.of(context).pushReplacementNamed('/');
            }),
            _buildListTile('Filters', Icons.settings, () {
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            }),
          ],
        ),

    );
  }
}
