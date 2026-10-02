import 'package:flutter/material.dart';

class Latihan3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [ 
          // Container(
          //   width: 50,
          //   color: Colors.red,
          // ),
          Expanded (
            flex: 2,
            child: Container(
              height: 50,
              color: const Color.fromARGB(255, 21, 255, 0),
              alignment: Alignment.center,
              child: Text("Pemasukan"),
            ),
           
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Container(
              height: 50,
              color: const Color.fromARGB(255, 247, 0, 255),
              alignment: Alignment.center,
              child: Text("Pengeluaran"),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            flex: 2,
            child: Container(
              height: 50,
              color: const Color.fromARGB(255, 78, 76, 175),
              alignment: Alignment.center,
              child: Text("Saldo"),
            ),
          ),
      
      
      
      
      
          
        ]
      ),
    );
  }
}
