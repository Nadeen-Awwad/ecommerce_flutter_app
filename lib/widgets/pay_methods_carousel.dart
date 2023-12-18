import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LogoCarousel extends StatefulWidget {
  final List<String> logoPaths;

  LogoCarousel({required this.logoPaths});

  @override
  _LogoCarouselState createState() => _LogoCarouselState();
}

class _LogoCarouselState extends State<LogoCarousel> {
  int _selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: widget.logoPaths.length,
      options: CarouselOptions(
        height: 60, 
        viewportFraction: 0.25, 
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        scrollDirection: Axis.horizontal,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        bool isSelected = index == _selectedCardIndex;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedCardIndex = index;
            });
          },
          child: Padding(
            padding: EdgeInsets.all(8.0), 
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isSelected ? Color.fromARGB(255, 102, 69, 194) : Colors.transparent,
                  width: 2.0, 
                ),
                borderRadius: BorderRadius.circular(8.0), 
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 4),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(1.0), 
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Image.asset(
                    widget.logoPaths[index],
                    fit: BoxFit.contain, 
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
