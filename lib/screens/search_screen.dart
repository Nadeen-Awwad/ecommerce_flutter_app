import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dahsborad.dart';
import '../Controllers/Controller.dart';
import '../models/Product.dart';
import '../widgets/searchProductCard.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ProductController productController = ProductController();
  late Future<List<Product>> productsFuture;

  @override
  void initState() {
    super.initState();
    productsFuture = productController.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search',style: TextStyle(  fontWeight: FontWeight.bold,),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  width: 280,
                  child: SearchBarBasic(), 
                ),
                    const SizedBox(width: 10),
                                    CircularImageWithShadow(
                            imageUrl: 'assets/images/search_sign.png',
                          ),
              ],
            ),
          ),
       
          Expanded(
            child: FutureBuilder<List<Product>>(
              future: productsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No products available.'),
                  );
                } else {
                  final products = snapshot.data!;
                  return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        imageUrl: product.imageUrl,
                        title: product.title,
                        price: product.price,
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
