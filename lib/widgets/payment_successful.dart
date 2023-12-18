import 'package:flutter/material.dart';

import '../screens/bottomTapBar.dart';

class PaymentSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            Image.asset(
              'assets/images/correct.png',  
    
            ),
            SizedBox(height: 20),  
           const Text(
              'Payment Successful!!',
              style: TextStyle(
                 fontFamily: 'Variable',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), 
           Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
             child: const Text(

                'Your order will be processed and sent to you as soon as possible.',
                style: TextStyle(
                   fontFamily: 'Variable',
                  fontSize: 16,
                ),
              ),
           ),
            SizedBox(height: 20),
          
              ElevatedButton(
                onPressed: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyTabBarApp()),
                );
                },
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(255, 139, 91, 218),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  minimumSize: Size(40, 40), 
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: Text(
                    'Continue Shopping',
                    style: TextStyle(
                       fontFamily: 'Variable',
                      color: Colors.white,
                      fontSize: 17,
                      height: 2.8,
                    ),
                  ),
                ),
              ),
            
          ],
        ),
      ),
    );
  }
}
