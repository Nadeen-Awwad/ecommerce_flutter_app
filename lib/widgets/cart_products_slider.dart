import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../models/Product.dart';

class CartItemSlider extends StatelessWidget {
  final List<Product> cartItems;

  CartItemSlider({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: cartItems.length,
      options: CarouselOptions(
        height: 120,
        viewportFraction: .32,
      ),
      itemBuilder: (context, index, realIndex) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                ),
              ],
            ),
            padding: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), 
              child: Image.network(
                cartItems[index].imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
