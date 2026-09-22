import 'package:flutter/material.dart';
import 'package:product_recipes/screens/productscreen.dart';
import 'package:product_recipes/screens/recipescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => MyAppScreen();
}

class MyAppScreen extends State<MyApp> {
  int currentIndex = 0;

  void navigate(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> screens = [const ProductScreen(), const RecipeScreen()];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: NavigationBar(
          selectedIndex: currentIndex,
          onDestinationSelected: navigate,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.shopping_cart),
              label: 'Products',
            ),
            NavigationDestination(
              icon: Icon(Icons.outdoor_grill),
              label: 'Recipies',
            ),
          ],
        ),
      ),
    );
  }
}
