import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/settings.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_details_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routs.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avaliableMeals = dummyMeals;
  List<Meal> _favoritMeals = [];
  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;
      _avaliableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoritMeals.contains(meal)
          ? _favoritMeals.remove(meal)
          : _favoritMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) {
    return _favoritMeals.contains(meal);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurple,
          ),
          hintColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(174, 46, 20, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      routes: {
        AppRouts.HOME: (ctx) => TabsScreen(favoriteMeals: _favoritMeals),
        AppRouts.CATEGORY_MEALS: (ctx) =>
            CategoriesMealsScreen(meals: _avaliableMeals),
        AppRouts.MEAL_DETAIL: (ctx) => MealDetailsScreen(
              onToggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        AppRouts.SETTINGS: (ctx) => SettingsScreen(
              onSettingsChanged: _filterMeals,
              settings: settings,
            ),
      },
      // onGenerateRoute: ((settings) {
      //   if(settings.name == '/alguma-coisa'){
      //     return null;
      //   } else if(settings.name == '/outra-coisa'){
      //     return null;
      //   } else {
      //     return MaterialPageRoute(builder: (_) {
      //       return CategoriesScreens();
      //     });
      //   }
      // }),
      // onUnknownRoute: ((settings) {
      //   return MaterialPageRoute(builder: (_) {
      //     return CategoriesScreens();
      //   });
      // })
    );
  }
}
