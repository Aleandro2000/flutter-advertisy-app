import 'package:advertisy/models/products.model.dart';
import 'package:advertisy/utils/color.dart';
import 'package:flutter/material.dart';

class ProductCardTemplate extends StatelessWidget {
  final Products product;

  const ProductCardTemplate({super.key, required this.product});

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
            if (product.thumbnail != null)
              Image.network(
                product.thumbnail!,
                fit: BoxFit.cover,
                height: 150,
                width: double.infinity,
              ),
            const SizedBox(height: 8),
            Text(
              product.title ?? 'No Title',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              product.description ?? 'No Description',
              style: TextStyle(color: ThemeColors.cardTextColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Text(
              '\$${product.price?.toStringAsFixed(2) ?? '00'}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ThemeColors.cardTextColor,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rating: ${product.rating?.toString() ?? 'N/A'}',
                  style: TextStyle(color: ThemeColors.cardTextColor),
                ),
                Text(
                  'Stock: ${product.stock?.toString() ?? 'N/A'}',
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
