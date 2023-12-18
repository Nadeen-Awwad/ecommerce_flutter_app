import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/YourActivity.dart';

import '../widgets/promotions.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Promotions", style: TextStyle(fontFamily: "Variable",fontSize: 20,fontWeight:FontWeight.bold),textAlign:TextAlign.start,),
                )),
          
              CardWidget(
                imagePath: 'assets/images/spec1.jpg',
                text: 'lorem ipsum dolor set amet, consectetur adipiscing, elit,sed,...',
                time: '10:00 AM',
              ),
                CardWidget(
                imagePath: 'assets/images/spec2.jpg',
                text: 'lorem ipsum dolor set amet, consectetur adipiscing, elit,sed,...',
                time: '1 day ago',
              ),
               const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Your Activity", style: TextStyle(fontFamily: "Variable",fontSize: 20,fontWeight:FontWeight.bold),textAlign:TextAlign.start,),
                )),
                 YourActivity(
                imagePath: 'assets/images/check.png',
                 minititile: 'Order Arrived',
                text: 'Order Arrived Order Arrived Order Arrived Order Arrived Order Arrived',
                time: 'Yesterday 10:45 AM',
              ),
              YourActivity(
                imagePath: 'assets/images/bags.png',
                 minititile: 'Order Success',
                text: 'Order Arrived Order Arrived Order Arrived Order Arrived Order Arrived',
                time: 'Yesterday 10:45 AM',
              ),
            ],
          ),
        ),
      );
    
  }
}
