import 'package:flutter/material.dart';
import 'package:product_recipes/models/product.dart';
import 'package:product_recipes/services/api.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => ProductScreenState();
}

class ProductScreenState extends State<ProductScreen> {
  List<Product> products = [];
  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(products[index].title),
              subtitle: Text('${products[index].price}'),
              leading: Image.network(products[index].image),
            ),
          );
        },
      ),
    );
  }

  Future<void> getProducts() async {
    products = await Api().getProducts();
    setState(() {});
  }
}
