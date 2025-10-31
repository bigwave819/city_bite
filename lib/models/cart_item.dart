import 'package:cityfood/models/food_model.dart';

class CartItem {
  FoodModel food;
  int quantity;

  CartItem({required this.food, required this.quantity});
}
