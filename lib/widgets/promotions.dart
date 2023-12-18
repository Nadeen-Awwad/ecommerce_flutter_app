import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final String time;

  CardWidget({
    required this.imagePath,
    required this.text,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
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
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                maxLines: 2, 
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      
    );
  }
}
