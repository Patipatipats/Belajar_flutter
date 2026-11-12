import 'package:flutter/material.dart';

import '../models/comment.dart';

class CommentDetailPage extends StatelessWidget {
  final Comment comment;

  const CommentDetailPage({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Comment #${comment.id}')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.email_outlined, size: 18),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    comment.email,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(comment.body),
            const SizedBox(height: 24),
            Text(
              'Komentar pada post #${comment.postId}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}