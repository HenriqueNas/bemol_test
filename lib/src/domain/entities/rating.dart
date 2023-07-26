import 'package:bemol_test/src/domain/entities/entity.dart';

class Rating implements Entity {
  const Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(
      rate: Entity.intOrDoubleToDouble(map['rate']),
      count: map['count'] as int,
    );
  }

  final double rate;
  final int count;

  @override
  bool get isValid => true;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rate': rate,
      'count': count,
    };
  }
}
