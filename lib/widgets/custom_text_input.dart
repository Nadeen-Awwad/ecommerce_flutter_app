import 'package:flutter/material.dart';

class MyCustomTextInput extends StatelessWidget {
  final String title;
  final String placeholder;
  final TextInputType inputType;
  final bool obscureText;

  const MyCustomTextInput({
    required this.title,
    required this.placeholder,
    required this.inputType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 108, 107, 107),
              fontWeight: FontWeight.bold,
              fontFamily: 'Variable',
            ),
          ),
          const SizedBox(height: 3.0),
          Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            child: TextFormField(
              keyboardType: inputType,
              obscureText: obscureText,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: placeholder,
                contentPadding: const EdgeInsets.only(left: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(
                fontSize: 15,
                color: Color.fromARGB(223, 52, 52, 52),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
