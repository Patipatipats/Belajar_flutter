import 'package:flutter/material.dart';
import 'package:belajar_flutter/routes/app_route.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.about);
              },
              child: Text('Masuk Profile'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.articleList);
              },
              child: Text('Masuk List'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.ig);
              },
              child: Text('Masuk Instagram'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.lat3);
              },
              child: Text('Masuk Latihan 3'),
            ),
          ],
        ),
      ),
    );
  }
}