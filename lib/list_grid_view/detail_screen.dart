
import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  final Map<String, String> data;

  const ArticleDetailScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(data['title']!),
        backgroundColor: const Color.fromARGB(255, 0, 126, 189),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.network(
              data['image']!,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              data['description']!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
