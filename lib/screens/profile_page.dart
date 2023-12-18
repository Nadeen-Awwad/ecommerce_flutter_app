import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/shipping_address.dart';
import '../widgets/custom_profile_card.dart';
import '../widgets/language.dart';
import 'Credits_payment.dart';
import 'checkout.dart';
import 'your_cart.dart';

class CustomCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<CustomCard> customCards = [
      CustomCard(iconData: Icons.person_2_rounded, cardName: 'My Account',onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => YourCartList()));
        },),
      CustomCard(iconData: Icons.shop, cardName: 'My Orders',onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckoutPage()));
        }),
      CustomCard(iconData: Icons.translate, cardName: 'Language Settings',onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => LanguageSelectScreen()));
        }),
      CustomCard(iconData: Icons.place, cardName: 'Shipping Address',onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Shipping()));
        }),
      CustomCard(iconData: Icons.card_membership, cardName: 'My Cards',onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => PayCard()));
        }),
      CustomCard(iconData: Icons.settings, cardName: 'Settings',onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => YourCartList()));
        }),
      CustomCard(iconData: Icons.note, cardName: 'Privacy Policy',onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => YourCartList()));
        }),
      CustomCard(iconData: Icons.note, cardName: 'FAQ!',onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => YourCartList()));
        }),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.all(1.0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/person.png'),
              ),
              SizedBox(height: 2), 
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: customCards.length,
            itemBuilder: (context, index) {
              return customCards[index];
            },
          ),
        ),
      ],
    );
  }
}
