import 'package:bemol_test/src/domain/entities/entity.dart';
import 'package:bemol_test/src/domain/entities/rating.dart';
import 'package:flutter/foundation.dart';

@immutable
class Product implements Entity {
  const Product({
    this.id,
    this.title,
    this.price,
    this.rating,
    this.category,
    this.imageUrl,
    this.description,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    final rating = map['rating'] as Map<String, dynamic>;

    return Product(
      id: map['id'] as int?,
      title: map['title'] as String?,
      price: Entity.intOrDoubleToDouble(map['price']),
      category: map['category'] as String?,
      rating: Rating.fromMap(rating),
      imageUrl: map['image'] as String?,
      description: map['description'] as String?,
    );
  }

  final int? id;
  final String? title;
  final double? price;
  final String? category;
  final Rating? rating;
  final String? imageUrl;
  final String? description;

  @override
  bool get isValid => id.isNotNull;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product && //
        other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
