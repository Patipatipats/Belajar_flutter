import 'package:flutter/material.dart';

class ExpendedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [ 
        Container(
          width: 50,
          color: Colors.red,
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 50,
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: Container(
            height: 50,
            color: Colors.green,
          ),
        ),





        
      ]
    );
  }
}
