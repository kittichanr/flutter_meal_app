import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String desscription,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(desscription),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitchListTile(
                  'Gluten',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (newValue) => setState(() => _glutenFree = newValue)),
              _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _vegetarian,
                  (newValue) => setState(() => _vegetarian = newValue)),
              _buildSwitchListTile('Vegan', 'Only include Vegan meals', _vegan,
                  (newValue) => setState(() => _vegan = newValue)),
              _buildSwitchListTile(
                  'LactoseFree',
                  'Only include lactose-free meals',
                  _lactoseFree,
                  (newValue) => setState(() => _lactoseFree = newValue)),
            ],
          ))
        ],
      ),
    );
  }
}
