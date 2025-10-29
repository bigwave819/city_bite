import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // 🔹 Fixed AppBar (not floating)
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true, // Stays at top when scrolling
            floating: false,
            elevation: 1,
            shadowColor: Colors.black12,
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Location with icon
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.orange.shade700,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Kigali, Rwanda',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),

                // Avatar with border
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage('images/avatar.png'),
                    backgroundColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Welcome Section
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello! 👋',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'What would you like to order today?',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 🔹 Food Cards Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildFoodCard(
                    title1: "SUMMER",
                    title2: "COMBO",
                    color: const Color(0xFFFF6B35),
                    image: 'images/burger-two.png',
                    reverseLayout: false,
                    description: "Special summer deals",
                  ),
                  const SizedBox(height: 20),
                  _buildFoodCard(
                    title1: "BURGERS",
                    color: const Color(0xFFFFD166),
                    image: 'images/burger-one.png',
                    reverseLayout: true,
                    description: "Juicy and delicious",
                  ),
                  const SizedBox(height: 20),
                  _buildFoodCard(
                    title1: "PIZZA",
                    color: const Color(0xFF06D6A0),
                    image: 'images/pizza-one.png',
                    reverseLayout: false,
                    description: "Fresh from the oven",
                  ),
                  const SizedBox(height: 20),
                  _buildFoodCard(
                    title1: "BURRITO",
                    color: const Color(0xFF118AB2),
                    image: 'images/buritto.png',
                    reverseLayout: true,
                    description: "Loaded with flavors",
                  ),
                  const SizedBox(height: 30), // Extra space at bottom
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🍔 Reusable Food Card with improved layout
  Widget _buildFoodCard({
    required String title1,
    String? title2,
    required Color color,
    required String image,
    required bool reverseLayout,
    String? description,
  }) {
    return Container(
      height: 160, // Slightly reduced height for better proportion
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background pattern
          Positioned(
            top: -20,
            right: reverseLayout ? null : -20,
            left: reverseLayout ? -20 : null,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),

          // Content
          Row(
            children: reverseLayout 
                ? [_buildImageSection(image), _buildTextSection(title1, title2, color, description)]
                : [_buildTextSection(title1, title2, color, description), _buildImageSection(image)],
          ),
        ],
      ),
    );
  }

  Widget _buildImageSection(String image) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Image.asset(
            image,
            fit: BoxFit.contain,
            height: 100,
            width: 100,
            errorBuilder: (context, error, stackTrace) => Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.fastfood,
                size: 40,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection(String title1, String? title2, Color color, String? description) {
    return Expanded(
      flex: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Title
            Text(
              title1,
              style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22,
                color: Colors.white,
                letterSpacing: 1.5,
                height: 1.1,
              ),
            ),
            
            // Subtitle if exists
            if (title2 != null)
              Text(
                title2,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 26,
                  color: Colors.white,
                  letterSpacing: 2.0,
                  height: 1.1,
                ),
              ),
            
            // Description
            if (description != null) ...[
              const SizedBox(height: 6),
              Text(
                description,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
            
            const SizedBox(height: 12),
            
            // Arrow button
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_forward,
                color: color,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}