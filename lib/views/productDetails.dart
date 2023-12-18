import 'package:flutter/material.dart';
import '../Controllers/Controller.dart';
import '../models/Product.dart';

class DetailsPage extends StatelessWidget {
  final Product product;
  final CartController cartController;

  DetailsPage({required this.product, required this.cartController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildBackButton(context),
          _buildProductInformation(),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned(
      top: 30,
      left: 0,
      right: 0,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(product.imageUrl),
            fit: BoxFit.scaleDown,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: 60,
      left: 20,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildProductInformation() {
    return Positioned(
      top: 350,
      left: 2,
      right: 2,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPriceAndFavorite(),
            SizedBox(height: 8.0),
            _buildProductTitle(),
            SizedBox(height: 16.0),
            _buildProductDescription(),
            const SizedBox(height: 10),
            _buildColorOptions(),
            SizedBox(height: 10),
            _buildSizeOptions(),
            _buildAddToCartButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndFavorite() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${product.price}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        const Icon(
          Icons.favorite,
          color: Colors.red,
        ),
      ],
    );
  }

  Widget _buildProductTitle() {
    return Text(
      product.title.split(" ")[0],
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildProductDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          limitText(product.description, 10),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildColorOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Color:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            _buildColorCircle(const Color.fromARGB(255, 188, 78, 70), true),
            _buildColorCircle(const Color.fromARGB(255, 78, 89, 78), false),
            _buildColorCircle(Color.fromARGB(255, 125, 180, 226), false),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildSizeButton("12"),
              _buildSizeButton("13"),
              _buildSizeButton("14"),
              _buildSizeButton("15"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          cartController.addToCart(product);
        },
        child: const Text(
          'Add To Cart',
          style: TextStyle(color: Colors.white, fontSize: 17, height: 2.8),
        ),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 139, 91, 218),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }

  Widget _buildColorCircle(Color color, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {},
        child: CircleAvatar(
          backgroundColor: color,
          radius: 16.0,
          child: isSelected
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 233, 231, 231),
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        ),
        child: Text(
          size,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  String limitText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return text.substring(0, maxLength) + '...';
    }
  }
}
