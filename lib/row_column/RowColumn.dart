import 'package:flutter/material.dart';

class Rowcolumn extends StatelessWidget {
  const Rowcolumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container( 
      width: double.infinity,
      height: 100,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.call),
              SizedBox(height: 10),
              Text("Call"),],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.route),
              SizedBox(height: 10),
              Text("Route"),],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.share),
              SizedBox(height: 10),
              Text("Share"),],
          ),
        ],
      )
      )
    );
  }
}