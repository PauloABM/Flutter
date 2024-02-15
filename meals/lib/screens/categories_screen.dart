import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../components/category_item.dart';

class CategoriesScreens extends StatelessWidget {
  const CategoriesScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20, // Espaçamento entre os itens
        mainAxisSpacing: 20, // Espaçamento entre os itens
      ),
      children: dummyCategories.map((category) {
        return CategoryItem(category: category);
      }).toList(),
    );
  }
}
