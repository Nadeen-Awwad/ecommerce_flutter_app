
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final double height;
  final double width;

  const LogoWidget({Key? key, this.height = 80.0, this.width = 80.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/BuyLogo.png',
      height: height,
      width: width,
    );
  }
}
