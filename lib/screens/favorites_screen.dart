import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  DBHelper dbHelper = DBHelper();
  List<Map<String, dynamic>> favorites = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    favorites = await dbHelper.getFavorites();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Favorites"), backgroundColor: Colors.deepOrangeAccent),
      body: favorites.isEmpty
          ? Center(child: Text("No favorites yet!", style: TextStyle(color: Colors.white70)))
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final coffee = favorites[index];
          bool isFav = coffee["isFavorite"] == 1;

          return ListTile(
            title: Text(coffee["name"], style: TextStyle(color: Colors.white)),
            subtitle: Text("Price: \$${coffee["price"]}", style: TextStyle(color: Colors.white70)),
            trailing: IconButton(
              icon: Icon(isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.deepOrangeAccent : Colors.white),
              onPressed: () async {
                await dbHelper.toggleFavorite(coffee["id"], !isFav);
                loadData();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isFav ? "Removed from favorites" : "Added to favorites"),
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}