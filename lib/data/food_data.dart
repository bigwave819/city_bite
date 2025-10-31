import 'package:cityfood/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:cityfood/models/cart_item.dart';

class Restaurant extends ChangeNotifier {
  final List<FoodModel> foodList = [
    FoodModel(
      name: 'Classic Beef Burger',
      image: 'images/foods/burger-one.jpg',
      description:
          'Juicy beef patty with lettuce, tomato, cheese, and our special sauce.',
      price: 5.99,
      category: FoodCategory.burger,
    ),
    FoodModel(
      name: 'Cheese Lover’s Pizza',
      image: 'images/foods/pizza-one.webp',
      description:
          'Loaded with mozzarella, cheddar, and parmesan for cheese lovers.',
      price: 8.49,
      category: FoodCategory.pizza,
    ),
    FoodModel(
      name: 'Chicken Burrito',
      image: 'images/foods/burrito-one.jpeg',
      description:
          'Grilled chicken, rice, and beans wrapped in a soft flour tortilla.',
      price: 6.75,
      category: FoodCategory.burrito,
    ),
    FoodModel(
      name: 'Double Bacon Burger',
      image: 'images/foods/burger-two.jpeg',
      description:
          'Two beef patties stacked with crispy bacon and melted cheddar cheese.',
      price: 7.25,
      category: FoodCategory.burger,
    ),
    FoodModel(
      name: 'Pepperoni Feast Pizza',
      image: 'images/foods/pizza-two.jpeg',
      description:
          'Loaded with crispy pepperoni slices and mozzarella on a golden crust.',
      price: 9.99,
      category: FoodCategory.pizza,
    ),
    FoodModel(
      name: 'Veggie Burrito',
      image: 'images/foods/burrito-two.jpeg',
      description:
          'Stuffed with beans, corn, peppers, and guacamole for a fresh veggie kick.',
      price: 6.25,
      category: FoodCategory.burrito,
    ),
    FoodModel(
      name: 'BBQ Chicken Pizza',
      image: 'images/foods/pizza-three.jpg',
      description:
          'Sweet and tangy BBQ sauce topped with grilled chicken and onions.',
      price: 10.50,
      category: FoodCategory.pizza,
    ),
    FoodModel(
      name: 'Spicy Jalapeño Burger',
      image: 'images/foods/burger-three.jpg',
      description:
          'Hot beef burger topped with jalapeños, pepper jack cheese, and aioli.',
      price: 6.95,
      category: FoodCategory.burger,
    ),
    FoodModel(
      name: 'Beef Burrito Supreme',
      image: 'images/foods/burrito-three.webp',
      description:
          'Seasoned beef, cheese, rice, and salsa rolled into a soft tortilla.',
      price: 7.10,
      category: FoodCategory.burrito,
    ),
  ];

  // cart
  final List<CartItem> _cart = [];

  // get the copy of the cart items
  List<CartItem> get cart => List.unmodifiable(_cart);

  //add to cart
  void addToCart(FoodModel food) {
    //check the existing foods
    final existingFood = _cart.firstWhereOrNull(
      (item) => item.food.name == food.name,
    );

    if (existingFood != null) {
      //increase the quantity only
      existingFood.quantity++;
    } else {
      _cart.add(CartItem(food: food, quantity: 1));
    }

    notifyListeners();
  }

  //remove to cart
  void removeFromCart(FoodModel food) {
    _cart.removeWhere((item) => item.food.name == food.name);
    notifyListeners();
  }

  //total price of the cart
  double get totalPrice {
    return _cart.fold(
      0.0,
      (sum, item) => sum + (item.food.price * item.quantity)
    );
  }

  //get total number of the Items in the cart
  int get totalItemInCart {
    return _cart.fold(0, (sum, item) => sum + item.quantity);
  }

  // Update quantity
  void updateQuantity(FoodModel food, int quantity) {
    final item = _cart.firstWhere(
      (element) => element.food == food,
      orElse: () => CartItem(food: food, quantity: 0),
    );

    if (item.quantity == 0) return; // Item not in cart

    if (quantity <= 0) {
      _cart.removeWhere((element) => element.food == food);
    } else {
      item.quantity = quantity;
    }
    notifyListeners();
  }

  //clear the whole cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }
}
