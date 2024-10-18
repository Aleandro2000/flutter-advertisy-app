import 'package:advertisy/models/posts.model.dart';
import 'package:advertisy/utils/color.dart';
import 'package:flutter/material.dart';

class PostCardTemplate extends StatelessWidget {
  final Posts post;

  const PostCardTemplate({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: ThemeColors.cardBackgroundColor,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title ?? 'No Title',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              post.body ?? 'No Content',
              style: TextStyle(color: ThemeColors.cardTextColor),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Views: ${post.views ?? 0}',
                  style: TextStyle(color: ThemeColors.cardTextColor),
                ),
                Text(
                  'Likes: ${post.reactions?.likes ?? 0}',
                  style: TextStyle(color: ThemeColors.cardTextColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
