import 'package:flutter/material.dart';

class LatihanContainer extends StatelessWidget {
  const LatihanContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container( 
     height: 200,
     width: 300,
     margin: EdgeInsets.all(20),
     padding: EdgeInsets.all(15),
     alignment: Alignment.bottomCenter,
     decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: 2,
      ),
      color: const Color.fromARGB(255, 14, 255, 6),
      borderRadius: BorderRadius.circular(8),    
     ),
      child: Column(
   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
              
              color: const Color.fromARGB(255, 218, 73, 210),
              image: DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-FSXTl1PR7h38pdHEr3XeczmfW1F8at86m1mxqXMJ5w&s=10"),
              fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8),
            ),  
          ),
          Column( 
            children: [
              Text("Biodata Siswa",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 56, 1, 255)
                )
              ),
              Text("Nama :Ipat"),
              Text("NISN : 123456789"),
              Text("Kelas : XII RPL 1 "),
            ],
          )
        ],
      )
      )
    );
  }
}