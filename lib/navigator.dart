import 'package:flutter/material.dart';
import 'package:belajar_flutter/list_grid_view/article_list_screen.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return ArticleListScreen();
                },
              ),
            );
          },
          child: Text("ArticleListScreen"), 
        ),
      ],
    );
  }
}
