import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key, required this.favoriteMeals});

  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreemIndex = 0;
  late List<Map<String, Object>> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens = [
      {'title': 'Lista de Categorias', 'screen': CategoriesScreens()},
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(favoriteMeals: widget.favoriteMeals)
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreemIndex]['title'] as String,
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreemIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedScreemIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (Icons.star),
            ),
            label: 'Favoritos',
          )
        ],
      ),
    );
  }
}
