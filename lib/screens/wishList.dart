import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/dahsborad.dart';
import '../Controllers/Controller.dart';
import '../models/Product.dart';
import '../widgets/searchProductCard.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
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
        title: Text('WishList',style: TextStyle(  fontWeight: FontWeight.bold,),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: 350,
            child: SearchBarBasic(), 
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
