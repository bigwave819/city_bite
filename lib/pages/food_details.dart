import 'package:cityfood/models/food_model.dart';
import 'package:flutter/material.dart';

class FoodDetailsPage extends StatefulWidget {
  final FoodModel food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // Calculate total price
    double totalPrice = widget.food.price * quantity;

    return Scaffold(
      body: Stack(
        children: [
          // Top image with improved error handling
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Container(
                height: 300,
                width: double.infinity,
                color: Colors.grey.shade200, // Fallback background
                child: _buildFoodImage(),
              ),
            ),
          ),

          // Back button (like iPhone)
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),

          // Content section
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name + Unit price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.food.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '\$${widget.food.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Category badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        widget.food.category.name.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Description
                    Text(
                      widget.food.description,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Quantity selector
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          icon: const Icon(Icons.remove_circle_outline),
                          color: Colors.orange,
                          iconSize: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            quantity.toString(),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline),
                          color: Colors.orange,
                          iconSize: 30,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Dynamic Add to Cart button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Add to Cart • \$${totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodImage() {
    // Check if it's a network image or asset
    if (widget.food.image.startsWith('http')) {
      return Image.network(
        widget.food.image,
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          print('Image loading error: $error');
          return _buildErrorImage();
        },
      );
    } else {
      // Assume it's an asset image
      return Image.asset(
        widget.food.image,
        width: double.infinity,
        height: 300,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          print('Asset image error: $error');
          return _buildErrorImage();
        },
      );
    }
  }

  Widget _buildErrorImage() {
    return Container(
      color: Colors.grey.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.fastfood,
            size: 80,
            color: Colors.grey.shade500,
          ),
          const SizedBox(height: 10),
          Text(
            'Image not available',
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}