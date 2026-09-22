import 'package:flutter/material.dart';
import 'package:product_recipes/models/recipes.dart';
import 'package:product_recipes/services/api.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => ProductScreenState();
}

class ProductScreenState extends State<ProductScreen> {
  List<Recipe> recipes = [];
  @override
  void initState() {
    super.initState();
    getRecipies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(recipes[index].name),
              subtitle: Text(recipes[index].cuisine),
              leading: Image.network(recipes[index].image),
            ),
          );
        },
      ),
    );
  }

  Future<void> getRecipies() async {
    recipes = await Api().getRecipes();
    setState(() {});
  }
}
