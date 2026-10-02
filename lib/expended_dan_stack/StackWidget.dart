  import 'package:flutter/material.dart';

  class StackWidget extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
      return Stack(
        children: [ 
        Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
        Positioned(
          bottom:10,
          right:10,
          child: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
        ),
        Positioned(
          right: 25,
          top: 25,
          left: 25,
          child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            image: DecorationImage(
              image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-FSXTl1PR7h38pdHEr3XeczmfW1F8at86m1mxqXMJ5w&s=10"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        )),
        Positioned ( 
          top: 10,
          left: 10,
          child: Text(
            "Label",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),













        ],
      );
    }
  }