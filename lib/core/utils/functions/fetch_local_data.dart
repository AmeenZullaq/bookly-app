import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_bookly/constants.dart';
import 'package:my_bookly/features/home/domain/entities/book_entity.dart';

List<BookEntity> fetchLocalData(int pageNumber) {
  int startIndex = pageNumber * 10;
  print('startIndex===================================$startIndex');
  int endIndex = (pageNumber + 1) * 10;
  print('endIndex===================================$endIndex');

  var box = Hive.box<BookEntity>(kFeaturedBooks);
  int length = box.values.length;
  print('length===================================$length');

  if (startIndex >= length || endIndex > length) {
    return [];
  }
  return box.values.toList().sublist(startIndex, endIndex);
}
