import 'package:flutter/material.dart';
import 'dart:math';
import '../Controllers/Controller.dart';
import '../models/Product.dart';
import 'dahsborad.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<CategoryProduct>> categoryProductsFuture;

  @override
  void initState() {
    super.initState();
    categoryProductsFuture = fetchCategoryProducts();
  }

  Future<List<CategoryProduct>> fetchCategoryProducts() async {
    final productController = ProductController();
    final products = await productController.getProducts();
    final categories = _groupProductsByCategory(products);
    final randomCategoryProducts = _selectRandomCategoryProducts(categories);

    return randomCategoryProducts;
  }

  Map<String, List<Product>> _groupProductsByCategory(List<Product> products) {
    final Map<String, List<Product>> categories = {};

    for (final product in products) {
      if (!categories.containsKey(product.category)) {
        categories[product.category] = [];
      }
      categories[product.category]!.add(product);
    }

    return categories;
  }

  List<CategoryProduct> _selectRandomCategoryProducts(Map<String, List<Product>> categories) {
    final List<CategoryProduct> randomCategoryProducts = [];

    categories.forEach((category, products) {
      final random = Random();
      final randomProduct = products[random.nextInt(products.length)];

      randomCategoryProducts.add(
        CategoryProduct(
          name: category,
          imageUrl: randomProduct.imageUrl,
        ),
      );
    });

    return randomCategoryProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 45,),
        _buildTitleRow(),
        Container(
          width: 340,
          child: SearchBarBasic(),
        ),
        _buildCategoryRows(),
      ],
    );
  }

  Align _buildTitleRow() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        ' Categories',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Variable',
        ),
      ),
    );
  }

  Widget _buildCategoryRows() {
    return FutureBuilder<List<CategoryProduct>>(
      future: categoryProductsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No categories available.');
        } else {
          final categoryProducts = snapshot.data!;
          final rows = <Widget>[];
          for (int i = 0; i < categoryProducts.length; i += 2) {
            if (i + 1 < categoryProducts.length) {
              rows.add(Row(
                children: [
                  _buildCategoryItem(categoryProducts[i]),
                  _buildCategoryItem(categoryProducts[i + 1]),
                ],
              ));
            } else {
              rows.add(Row(
                children: [
                  _buildCategoryItem(categoryProducts[i]),
                ],
              ));
            }
          }
          return Column(children: rows);
        }
      },
    );
  }

  Widget _buildCategoryItem(CategoryProduct categoryProduct) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
        
        },
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 8, right: 8),
          child: Stack(
            children: [
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.network(
                      categoryProduct.imageUrl,
                      fit: BoxFit.cover,
                      width: 200,
                      height: 120,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
              Positioned.fill(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0, 
                child: Container(
                  padding: EdgeInsets.all(8.0), 
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Text(
                    categoryProduct.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Variable',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryProduct {
  final String name; 
  final String imageUrl;

  CategoryProduct({
    required this.name,
    required this.imageUrl,
  });
}