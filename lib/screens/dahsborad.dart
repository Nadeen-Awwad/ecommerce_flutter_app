import 'package:flutter/material.dart';
import '../views/FeaturedProducts.dart';
import '../views/SpecialForYou.dart';
import 'package:badges/badges.dart' as badges;

import 'notifications.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SearchBarBasic(),
                        const SizedBox(width: 10),
                        badges.Badge(
                          badgeContent: Text('3'),
                          child: CircularImageWithShadow(
                            imageUrl: 'assets/images/shopping.png',
                          ),
                        ),
                        const SizedBox(width: 10),
                        CircularImageWithShadow(
                          imageUrl: 'assets/images/bell.png',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Notifications()),
                            );
                          },
                        )
                      ]),
                ),
                SpecialForYou(),
                FeaturedProducts(title: "  Featured Products"),
                FeaturedProducts(title: "  Best Selling Products"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBarBasic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 3.0),
            Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 3,
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Search",
                  contentPadding: const EdgeInsets.only(left: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Container(
               
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(
                          50),
                    ),
                    child: Image.asset(
                      'assets/images/search.png',
                      height: 10,
                      width: 15,
                    ),
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
      ),
    );
  }
}

class CircularImageWithShadow extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onTap;

  CircularImageWithShadow({required this.imageUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
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
      ),
    );
  }
}
