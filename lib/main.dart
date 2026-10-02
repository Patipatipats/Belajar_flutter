// import 'package:belajar_flutter/row_column/RowWidget.dart';
// import 'package:belajar_flutter/row_column/column_widget.dart';
// import 'package:belajar_flutter/container/latihancontainer.dart';
// import 'package:belajar_flutter/container/latihancontainer.dart';
// import 'package:belajar_flutter/row_column/RowColumn.dart';
// r
// import 'package:belajar_flutter/expended_dan_stack/ExpendedWidget.dart';
// import 'package:belajar_flutter/expended_dan_stack/LayoutDua.dart';
// import 'package:belajar_flutter/expended_dan_stack/LayoutSatu.dart';
// import 'package:belajar_flutter/expended_dan_stack/layout4.dart';
import 'package:belajar_flutter/latihan/gridinstagram.dart';
// import 'package:belajar_flutter/latihan/latihan3.dart';
// import 'package:belajar_flutter/expended_dan_stack/LayoutSatu.dart';

// import 'package:belajar_flutter/sized_box/SizedBoxWidget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
            appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 126, 189),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),

          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d',
                ),
              ),

              const SizedBox(width: 12),

              const Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fatahillah Akbar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "XII RPL 1",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        body: Gridinstagram(),
      ),
    );
  }
}

class hellowidget extends StatelessWidget {
  const hellowidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello, Flutter!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 0, 0, 0),
          background: Paint()
            ..color = const Color.fromARGB(255, 255, 238, 7).withOpacity(0.5),
        ),
      ),
    );
  }
}
