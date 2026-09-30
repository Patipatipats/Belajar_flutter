// import 'package:belajar_flutter/row_column/RowWidget.dart';
// import 'package:belajar_flutter/row_column/column_widget.dart';
// import 'package:belajar_flutter/container/latihancontainer.dart';
// import 'package:belajar_flutter/container/latihancontainer.dart';
// import 'package:belajar_flutter/row_column/RowColumn.dart';
import 'package:belajar_flutter/container/latihancontainer2.dart';
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
          title: Text('LATIHAN CONTAINER!!', style: TextStyle(color: const Color.fromARGB(255, 0, 22, 145))),
          backgroundColor: const Color.fromARGB(255, 236, 4, 186),
          centerTitle: true,
        ),
        body: LatihanContainer()
      ),
    );
  }
}

class hellowidget extends StatelessWidget {
  const hellowidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Hello, Flutter!' , style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: const Color.fromARGB(255, 0, 0, 0),
      background: Paint()..color = const Color.fromARGB(255, 255, 238, 7).withOpacity(0.5)
    )));
  }
}
