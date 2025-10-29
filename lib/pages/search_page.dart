import 'package:cityfood/pages/food_details.dart';
import 'package:flutter/material.dart';
import 'package:cityfood/models/food_model.dart';
import 'package:cityfood/data/food_data.dart'; // contains Restaurant

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int selectedIndex = 0;
  String searchQuery = '';

  // ✅ Create an instance of Restaurant
  final Restaurant restaurant = Restaurant();

  // "All" is represented by null; other categories come from the enum
  final List<FoodCategory?> categories = [null, ...FoodCategory.values];

  @override
  Widget build(BuildContext context) {
    // ✅ Access foodList through the instance
    final filteredFoods = restaurant.foodList.where((food) {
      final matchesCategory =
          selectedIndex == 0 || food.category == categories[selectedIndex];
      final matchesSearch = food.name.toLowerCase().contains(
            searchQuery.toLowerCase(),
          );
      return matchesCategory && matchesSearch;
    }).toList();

    filteredFoods.sort((a, b) => a.category.index.compareTo(b.category.index));

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔍 Search Bar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 5),
                  ],
                ),
                child: TextField(
                  onChanged: (value) => setState(() => searchQuery = value),
                  decoration: const InputDecoration(
                    hintText: 'Search for food',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // 🟠 Category Buttons
              SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final isSelected = selectedIndex == index;
                    final label = index == 0
                        ? 'All'
                        : categories[index]!.name[0].toUpperCase() +
                            categories[index]!.name.substring(1);

                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onTap: () => setState(() => selectedIndex = index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color.fromARGB(255, 255, 132, 0)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: isSelected
                                  ? const Color.fromARGB(255, 255, 132, 0)
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: Text(
                            label,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey.shade700,
                              fontWeight:
                                  isSelected ? FontWeight.bold : FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // 🍔 Food Grid
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 2 / 3,
                  ),
                  itemCount: filteredFoods.length,
                  itemBuilder: (context, index) {
                    final food = filteredFoods[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FoodDetailsPage(food: food),
                          ),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // 🖼️ Food Image
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(15),
                                ),
                                child: Image.asset( // 🔄 Use asset image
                                  food.image,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.fastfood, size: 50),
                                ),
                              ),
                            ),

                            // 📝 Food Details
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    food.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '\$${food.price.toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  GestureDetector(
                                    onTap: () {
                                      // 🛒 Add to cart logic here
                                    },
                                    child: const Text(
                                      '+ Add to cart',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
