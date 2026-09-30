import 'package:flutter/material.dart';

class Rowwidget extends StatelessWidget {
  const Rowwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("row1"), 
        Text("row2"), 
        Text("row3"),
      ]
    );
  }
}
