import 'package:flutter/material.dart';

class YourActivity extends StatelessWidget {
  final String imagePath;
  final String minititile;
  final String text;
  final String time;

  YourActivity({
    required this.imagePath,
    required this.minititile,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
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
      child: Column(
            children: [
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset(
                    imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  minititile,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  maxLines: 2, 
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Column(
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: Color.fromARGB(255, 117, 116, 116),
                        fontSize: 13,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        time,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 163, 163, 163),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
      
    );
  }
}
