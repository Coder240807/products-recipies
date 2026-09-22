import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:product_recipes/models/product.dart';
import 'package:product_recipes/models/recipes.dart';

class Api {
  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List list = data['products'];
      return list.map((item) => Product.fromJson(item)).toList();
    }
    throw Exception('Error');
  }

  Future<List<Recipe>> getRecipes() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List list = data['recipes'];
      return list.map((item) => Recipe.fromJson(item)).toList();
    }
    throw Exception('Error');
  }
}
