import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: _buildSearchContainer(),
    );
  }

  Widget _buildSearchContainer() {
    return Container(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 3.0),
          _buildSearchField(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 3,
      child: TextFormField(
        decoration: _searchFieldDecoration(),
        style: const TextStyle(
          fontSize: 15,
          color: Color.fromARGB(223, 52, 52, 52),
        ),
      ),
    );
  }

  InputDecoration _searchFieldDecoration() {
    return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: "Search",
      contentPadding: const EdgeInsets.only(left: 15),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60),
        borderSide: BorderSide.none,
      ),
      prefixIcon: _buildPrefixIcon(),
    );
  }

  Container _buildPrefixIcon() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Image.asset(
        'assets/images/search.png',
        height: 10,
        width: 15,
      ),
    );
  }
}
