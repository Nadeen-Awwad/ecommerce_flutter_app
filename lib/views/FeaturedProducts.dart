import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Controllers/Controller.dart';
import '../models/Product.dart';
import 'productDetails.dart';

class FeaturedProducts extends StatefulWidget {
  final String title;

  FeaturedProducts({Key? key, required this.title}) : super(key: key);

  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  final ProductController productController = ProductController();
  late Future<List<Product>> productsFuture;
  final CarouselController _carouselController = CarouselController();
  Product? tappedProduct;

  @override
  void initState() {
    super.initState();
    productsFuture = productController.getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTitleRow(),
        
        _buildProductCarousel(),
      ],
    );
  }

  Row _buildTitleRow() {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Variable',
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () => _carouselController.nextPage(),
          child: const Text(
            'See More',
            style: TextStyle(
              color: Color.fromARGB(255, 130, 127, 127),
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  FutureBuilder<List<Product>> _buildProductCarousel() {
    return FutureBuilder<List<Product>>(
      future: productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No products available.');
        } else {
          return _buildCarousel(snapshot.data!);
        }
      },
    );
  }

  CarouselSlider _buildCarousel(List<Product> products) {
    return CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2,
        enlargeCenterPage: false,
        viewportFraction: 0.35,
        initialPage: 0,
      ),
      items: products.map((product) => _buildCarouselItem(product)).toList(),
    );
  }

  GestureDetector _buildCarouselItem(Product product) {
    return GestureDetector(
      onTap: () {
       Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailsPage(
      product: product,
      cartController: CartController(), 
    ),
  ),
);
      },
      child: _buildProductItem(product),
    );
  }

  Container _buildProductItem(Product product) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8.0),
    child: Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                product.imageUrl, 
                fit: BoxFit.cover,
                width: 400,
                height: 120,
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              child: Container(
                width: 40,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: const Color.fromARGB(255, 124, 54, 244), // You can change the heart icon color
                  ),
                  onPressed: () {
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          product.title.split(' ')[0], 
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '\$${product.price}', 
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

}
