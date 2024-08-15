import 'package:hive_flutter/adapters.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 1)
class BookEntity {
  @HiveField(1)
  final String bookId;
  @HiveField(2)
  final String? image;
  @HiveField(3)
  final String title;
  @HiveField(4)
  final String? authorName;
  @HiveField(5)
  final num? price;
  @HiveField(6)
  final num? rating;
  @HiveField(7)
  final int? ratingsCount;

  BookEntity({
    required this.ratingsCount,
    required this.bookId,
    required this.image,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rating,
  });
}
