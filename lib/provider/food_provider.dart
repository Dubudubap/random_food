import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:random_food/provider/food_name.dart';

class FoodResult extends ChangeNotifier {
  String _foodResult = 'result';
  String get foodResult => _foodResult;

  void selectFood(List list) {
    final int foodNums = list.length;
    final int foodIndex = Random().nextInt(foodNums);
    _foodResult = list[foodIndex];
    notifyListeners();
  }
}

class Category extends ChangeNotifier {
  List category = total;

  void selectCategory(List list) {
    category = list;
    notifyListeners();
  }
}
