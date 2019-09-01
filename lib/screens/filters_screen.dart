import 'package:deli_meals/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function updateFiltes;
  final Map<String,bool> currentFilters;

  FiltersScreen(this.currentFilters,this.updateFiltes);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree;
  bool _lactoseFree;
  bool _vegan;
  bool _vegetarian;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () => widget.updateFiltes(context,
                {
                  'gluten': _glutenFree,
                  'lactose':_lactoseFree,
                  'vegan':_vegan,
                  'vegetarian':_vegetarian,
                }
              ),
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjuct your meal selection',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SwitchListTile(
                    title: Text('Gluten-Free'),
                    value: _glutenFree,
                    subtitle: Text(
                      'Include gluten-free meals',
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Lactose-Free'),
                    value: _lactoseFree,
                    subtitle: Text(
                      'Include lactose-free meals',
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegan'),
                    value: _vegan,
                    subtitle: Text(
                      'Include vegan meals',
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text('Vegetarian'),
                    value: _vegetarian,
                    subtitle: Text(
                      'Include vegetarian meals',
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
