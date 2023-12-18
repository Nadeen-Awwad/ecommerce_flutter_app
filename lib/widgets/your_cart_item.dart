import 'package:flutter/material.dart';
import '../models/Product.dart'; 

class ProductCard extends StatefulWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final List<String> titleWords = widget.product.title.split(' ');
    final String truncatedTitle = titleWords.length > 3
        ? titleWords.sublist(0, 3).join(' ')
        : widget.product.title;

    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(0, 4),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            child: Image.network(widget.product.imageUrl, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                    child: Text(
                      truncatedTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Text(
                      '\$${widget.product.price}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildQuantityButton(Icons.add, true),
                Text('$quantity'),
                _buildQuantityButton(Icons.remove, false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, bool isIncrement) {
    return IconButton(
      icon: Icon(icon, size: 20),
      onPressed: () {
        setState(() {
          if (isIncrement) {
            quantity++;
          } else {
            if (quantity > 1) quantity--;
          }
        });
      },
    );
  }
}

