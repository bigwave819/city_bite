enum FoodCategory { burger, burrito, pizza }

extension FoodCategoryExtension on FoodCategory {
  String get name {
    switch (this) {
      case FoodCategory.burger:
        return 'Burger';
      case FoodCategory.burrito:
        return 'Burrito';
      case FoodCategory.pizza:
        return 'Pizza';
    }
  }
}

class FoodModel {
  final String name;
  final String image;
  final String description;
  final double price;
  final FoodCategory category;

  const FoodModel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.category,
  });
}
