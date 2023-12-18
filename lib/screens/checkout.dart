import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/cart_products_slider.dart';

import '../Controllers/Controller.dart';
import '../widgets/pay_methods_carousel.dart';
import '../widgets/payment_successful.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final List<String> logoPaths = [
    'assets/images/paypal.png',
    'assets/images/visa.png',
    'assets/images/card.png',
    'assets/images/apple-pay.png',
    'assets/images/google.png',
  ];

  final CartController cartController = CartController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Check Out'),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            CheckoutRow(
              title: 'Your Address',
              buttonText: 'Change Address',
              onPressed: () {
              },
            ),
            Container(
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
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe, +961-12345678 Schools Street Behind the Official School, Maghdouche, Saida, Lebanon, 1600",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 144, 144, 144),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CheckoutRow(
              title: 'Shipping Mode',
              buttonText: 'Change Mode',
              onPressed: () {
              },
            ),
            Container(
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
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Flat Rate",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 144, 144, 144),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "\$20.0",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 139, 41, 185),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CheckoutRow(
              title: 'Your Cart',
              buttonText: 'View All',
              onPressed: () {
              
              },
            ),
            Container(
                height: 150,
                child: CartItemSlider(cartItems: cartController.cartItems)),
            CheckoutRow(
              title: 'Payment Method',
              buttonText: '',
              onPressed: () {
              },
            ),
            Center(
              child: LogoCarousel(logoPaths: logoPaths),
            ),
            CheckoutRow(
              title: 'Order Summary',
              buttonText: '',
              onPressed: () {
               
              },
            ),
           Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, 
  children: [
    const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total:',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
        ),
        Text(
          '\$170.0',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentSuccessPage()),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 139, 91, 218),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      child: const Text(
        'Pay Now',
        style: TextStyle(
          color: Colors.white,
          fontSize: 17,
          height: 2.8,
        ),
      ),
    ),
  ],
)

          ],
        ));
  }
}

class CheckoutRow extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback onPressed;

  CheckoutRow({
    required this.title,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Variable',
            ),
          ),
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: const TextStyle(
              color: Color.fromARGB(255, 130, 127, 127),
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}
