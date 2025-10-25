import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 🟠 Floating AppBar
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                // Address
                Text(
                  'Kigali, Rwanda',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),

                // Avatar on the right
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('images/avatar.png'),
                ),
              ],
            ),
          ),

          // 🧱 Cards Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildFoodCard(
                    title1: "SUMMER",
                    title2: "COMBO",
                    color: Colors.deepOrange,
                    image: 'images/burger-two.png',
                    reverseLayout: false,
                  ),
                  _buildFoodCard(
                    title1: "BURGERS",
                    color: Colors.amber,
                    image: 'images/burger-one.png',
                    reverseLayout: true,
                  ),
                  _buildFoodCard(
                    title1: "PIZZA",
                    color: const Color.fromARGB(255, 53, 88, 49),
                    image: 'images/pizza-one.png',
                    reverseLayout: false,
                  ),
                  _buildFoodCard(
                    title1: "BURRITO",
                    color: Colors.orange,
                    image: 'images/buritto.png',
                    reverseLayout: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🍔 Reusable Food Card
  Widget _buildFoodCard({
    required String title1,
    String? title2,
    required Color color,
    required String image,
    required bool reverseLayout,
  }) {
    final content = [
      // 🖼️ Image
      Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            image,
            fit: BoxFit.contain,
            height: 120,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.error, size: 50, color: Colors.white),
          ),
        ),
      ),

      // 🧾 Text + Arrow
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                reverseLayout ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                title1,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white,
                  letterSpacing: 2.0,
                ),
              ),
              if (title2 != null)
                Text(
                  title2,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 34,
                    color: Colors.white,
                    letterSpacing: 3.0,
                  ),
                ),
              const SizedBox(height: 10),
              Align(
                alignment: reverseLayout
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: color,
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ];

    return Container(
      height: 180,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: reverseLayout ? content : content.reversed.toList(),
      ),
    );
  }
}
