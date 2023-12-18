import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/Product.dart';

class ProductController {
  Future<List<Product>> getProducts() async {
    var url = Uri.parse('https://fakestoreapi.com/products');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> productsJson = json.decode(response.body);
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
class CartController {
  static final CartController _instance = CartController._internal();

  factory CartController() {
    return _instance;
  }

  CartController._internal();

  List<Product> cartItems = [];

  void addToCart(Product product) {
    cartItems.add(product);
  }

}
Future<void> addFirstFiveProductsToCart() async {
  ProductController productController = ProductController();
  CartController cartController = CartController();

  try {
    List<Product> products = await productController.getProducts();
    for (int i = 0; i < products.length && i < 5; i++) {
      cartController.addToCart(products[i]);
    }
  } catch (e) {
    print('Error fetching products: $e');
  }
}

