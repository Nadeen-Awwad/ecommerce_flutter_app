import 'package:flutter/material.dart';
import '../widgets/shipping_address.dart';

class Shipping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shipping Address',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'Variable'),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Text(
              'Your Shipping Address',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            ShippingAddress(
              imagePath: 'assets/images/location.png',
              minititile: 'John Doe +971-5685683',
              text:
                  'Schools street, behind the official street,Maghdooshe,Saida,Lebanon,1600',
            ),
            ShippingAddress(
              imagePath: 'assets/images/location.png',
              minititile: 'John Doe +971-5685683',
              text:
                  'Schools street, behind the official street,Maghdooshe,Saida,Lebanon,1600',
            ),
             ShippingAddress(
              imagePath: 'assets/images/location.png',
              minititile: 'John Doe +971-5685683',
              text:
                  'Schools street, behind the official street,Maghdooshe,Saida,Lebanon,1600',
            ),
          ],
        ),
      ),
    );
  }
}
