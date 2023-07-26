import 'package:bemol_test/app/app.dart';
import 'package:bemol_test/l10n/l10n.dart';
import 'package:bemol_test/src/domain/entities/product.dart';
import 'package:bemol_test/src/domain/entities/rating.dart';
import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    required this.product,
    super.key,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    if (!product.isValid) return const SizedBox.shrink();

    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Flexible(
          flex: 3,
          child: _Image(product.imageUrl!),
        ),
        const SizedBox(width: 20),
        Flexible(
          flex: 7,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title!,
                maxLines: 2,
                overflow: TextOverflow.clip,
                style: textTheme.titleMedium?.bold,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Rating(product.rating!),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: BemolColors.red,
                    ),
                  ),
                ],
              ),
              Text(
                '\$${product.price!.toStringAsFixed(2).padLeft(4, '0')}',
                style: textTheme.titleLarge?.bold?.copyWith(
                  color: BemolColors.orange,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  const _Image(this.imageUrl);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const CircularProgressIndicator(),
          Image.network(
            imageUrl,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}

class _Rating extends StatelessWidget {
  const _Rating(
    this.rating,
  );

  final Rating rating;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.star, color: BemolColors.yellow),
        const SizedBox(width: 8),
        Text(
          rating.rate.toString(),
          style: textTheme.bodyLarge?.ratingStyle,
        ),
        const SizedBox(width: 4),
        Text(
          '(${rating.count} ${context.l10n.productReviews})',
          style: textTheme.bodyMedium?.ratingStyle,
        ),
      ],
    );
  }
}
