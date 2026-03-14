import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/single_item_screen.dart';

class ItemWidget extends StatelessWidget {
  final String title;
  final String searchQuery;

  ItemWidget({required this.title, this.searchQuery = ""});

  // All coffee items
  final List<String> allItems = [
    'Black Coffee',
    'Cold Coffee',
    'Espresso',
    'Latte',
  ];

  // Filter items based on selected tab
  List<String> getItemsByCategory() {

    if (title == "All") {
      return allItems;
    }

    if (title == "Cold Coffee") {
      return ['Cold Coffee'];
    }

    if (title == "Hot Coffee") {
      return ['Black Coffee', 'Espresso', 'Latte'];
    }

    if (title == "Americano") {
      return ['Black Coffee'];
    }

    if (title == "Cappuccino") {
      return ['Latte'];
    }

    return allItems;
  }

  @override
  Widget build(BuildContext context) {

    // First filter by category
    List<String> categoryItems = getItemsByCategory();

    // Then filter by search
    final filteredItems = categoryItems.where((item) {
      return item.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    if (filteredItems.isEmpty) {
      return Center(
        child: Text(
          "No results found",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, i) {

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 8,
              ),
            ],
          ),

          child: Column(
            children: [

              // Coffee image
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SingleItemScreen(filteredItems[i]),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/images/${filteredItems[i]}.png',
                    fit: BoxFit.contain,
                    width: 120,
                    height: 120,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      filteredItems[i],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "Best Coffee",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    const Text(
                      "\$30",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        CupertinoIcons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
