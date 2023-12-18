import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../Controllers/Controller.dart';
import '../models/Product.dart';

class SpecialForYou extends StatefulWidget {
  @override
  _SpecialForYouState createState() => _SpecialForYouState();
}

class _SpecialForYouState extends State<SpecialForYou> {
  final ProductController productController = ProductController();
  late Future<List<Product>> productsFuture;

  final CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    productsFuture = productController.getProducts();
  }

  moveCarouselToLeft() {
    _carouselController.nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "   Special for you",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Variable',
                ),
              ),
            ),
            Spacer(),
            TextButton(
              onPressed: moveCarouselToLeft,
              child: const Text(
                'See More',
                style: TextStyle(
                  color: Color.fromARGB(255, 130, 127, 127),
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        FutureBuilder<List<Product>>(
          future: productsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return buildCarousel(snapshot.data!);
            } else {
              return Text('No products found');
            }
          },
        ),
      ],
    );
  }

  Widget buildCarousel(List<Product> products) {
    return CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
        autoPlay: false,
        aspectRatio: 2.58,
        enlargeCenterPage: false,
        viewportFraction: 0.7,
        initialPage: 0,
      ),
      items: products.map((product) => buildProductItem(product)).toList(),
    );
  }

  Widget buildProductItem(Product product) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Stack(
            children: <Widget>[
              Image.network(product.imageUrl, fit: BoxFit.cover, width: 400),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 29, 29, 29).withOpacity(0.4),
                ),
              ),
              Positioned(
                left: 10,
                top: 10,
                child: Text(
                  product.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
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
