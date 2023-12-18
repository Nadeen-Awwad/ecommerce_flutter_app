import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final IconData iconData;
  final String cardName;
  final VoidCallback onPressed;

  CustomCard({
    required this.iconData,
    required this.cardName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5.0, 
      shadowColor: Colors.grey.withOpacity(0.5), 
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(40.0),
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: ListTile(
            leading: Icon(iconData),
            title: Text(cardName),
            trailing: Container(
              width: 13.0,
              child: Image.asset("assets/images/right-arrow.png"),
            ),
          ),
        ),
      ),
    );
  }
}
