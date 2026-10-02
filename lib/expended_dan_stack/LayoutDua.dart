import 'package:flutter/material.dart';

class Layoutdua extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
          ),
          Positioned(
            top:0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(4),
              color: Colors.red,
              child: Text("20%"),
            ),
          ),
          Positioned(bottom:0 , right: 0, child: Icon(Icons.favorite_border)),
        ],
      ),
    );
  }
}
