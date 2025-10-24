import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onSearchPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
    this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: preferredSize.height,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back arrow
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: onBackPressed ?? () => Navigator.pop(context),
          ),

          // Title centered
          Expanded(
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          // Search icon
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: onSearchPressed,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
