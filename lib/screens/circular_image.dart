import 'package:flutter/material.dart';

class CircularImageWithShadow extends StatelessWidget {
  final String imageUrl;

  const CircularImageWithShadow({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(0, 1.5),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          imageUrl,
          height: 30,
          width: 30,
        ),
      ),
    );
  }
}
