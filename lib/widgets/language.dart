import 'package:flutter/material.dart';

class LanguageSelectScreen extends StatelessWidget {
  final List<Map<String, dynamic>> languages = [
    {"name": "English", "flag": "🇺🇸"},
    {"name": "French", "flag": "🇫🇷"},
    {"name": "German", "flag": "🇩🇪"},
    {"name": "Chinese", "flag": "🇨🇳"},
    {"name": "Japanese", "flag": "🇯🇵"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Language'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, bottom: 16.0),
            child: Center(
              child: Text(
                'Select a language',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
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
                    child: 
                       ListTile(
                        leading: Text(
                          languages[index]['flag'],
                          style: TextStyle(fontSize: 24),
                        ),
                        title: Text(languages[index]['name']),
                        onTap: () {
                          print('Selected ${languages[index]['name']}');
                        },
                    
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
