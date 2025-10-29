import 'package:flutter/material.dart';

class ScrollHideAppBarPage extends StatelessWidget {
  const ScrollHideAppBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar hides when scrolling down
          SliverAppBar(
            title: const Text(
              'My Title',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            floating: true, // makes it disappear and reappear smoothly
            snap: true, // optional: snaps into view when scrolling up
            backgroundColor: Colors.grey.shade200,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
            ],
          ),

          // Scrollable content
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                title: Text('Item $index'),
              ),
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
