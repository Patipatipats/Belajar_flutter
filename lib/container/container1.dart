import 'package:flutter/material.dart';

class container1 extends StatelessWidget {
  const container1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 238, 161),
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-FSXTl1PR7h38pdHEr3XeczmfW1F8at86m1mxqXMJ5w&s=10"), 
        fit: BoxFit.cover),
      ),
      child: Text("testttt",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white
        )
      ),
    );
  }
}