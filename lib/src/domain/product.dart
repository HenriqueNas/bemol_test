import 'package:bemol_test/src/domain/entity.dart';

class Product implements Entity {
  const Product({
    this.id,
    this.name,
    this.price,
    this.rating,
    this.reviews,
    this.imageUrl,
    this.description,
  });

  final String? id;
  final String? name;
  final int? price;
  final int? reviews;
  final double? rating;
  final String? imageUrl;
  final String? description;

  @override
  bool get isValid => id.isNotNull && id!.isNotEmpty;
}
