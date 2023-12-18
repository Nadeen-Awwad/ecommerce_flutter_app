import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PayCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'My Cards',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'Variable'),
        ),
        centerTitle: true, 
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: 
              Text(
                'Your payment cards',
                style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildCreditCard(
                  cardNumber: '4242 4242 4242 4242',
                  expiryDate: '08/24',
                  cardHolderName: 'Cardholder Name',
                  cardType: CardType.visa,
                  bgColor: Color.fromARGB(255, 38, 37, 37),
                  isSelected: true,
                ),
                _buildCreditCard(
                  cardNumber: '5555 5555 5555 4444',
                  expiryDate: '07/23',
                  cardHolderName: 'Another Name',
                  cardType: CardType.mastercard,
                  bgColor: const Color.fromARGB(255, 167, 167, 167),
                  isSelected: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreditCard({
    required String cardNumber,
    required String expiryDate,
    required String cardHolderName,
    required CardType cardType,
    required Color bgColor,
    bool isSelected = false,
  }) {
    Color borderColor = isSelected ? Colors.purple : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: bgColor,
          border: Border.all(color: borderColor, width: 2.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  isChipVisible: false,
                  animationDuration: Duration(milliseconds: 1000),
                  isHolderNameVisible: true,
                  cvvCode: '123',
                  bankName: 'Bank Name',
                  showBackView: false,
                  cardType: cardType,
                  onCreditCardWidgetChange: (CreditCardBrand brand) {},
                  cardBgColor: bgColor,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
