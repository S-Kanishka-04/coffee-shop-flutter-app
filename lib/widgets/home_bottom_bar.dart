
import 'package:flutter/material.dart';
import '../Screens/profile_screen.dart';
import '../Screens/favorites_screen.dart';

class HomeBottomBar extends StatefulWidget {
  @override
  _HomeBottomBarState createState() => _HomeBottomBarState();
}

class _HomeBottomBarState extends State<HomeBottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      // Home
      Navigator.popUntil(context, (route) => route.isFirst);
    }

    else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => FavoritesScreen()),
      );
    }

    else if (index == 2) {
      // Notification message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No new notifications"),
          duration: Duration(seconds: 2),
        ),
      );
    }

    else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          IconButton(
            icon: Icon(
              Icons.home,
              color: _selectedIndex == 0
                  ? Colors.deepOrangeAccent
                  : Colors.white,
              size: 35,
            ),
            onPressed: () => _onItemTapped(0),
          ),

          IconButton(
            icon: Icon(
              Icons.favorite_outlined,
              color: _selectedIndex == 1
                  ? Colors.deepOrangeAccent
                  : Colors.white,
              size: 35,
            ),
            onPressed: () => _onItemTapped(1),
          ),

          IconButton(
            icon: Icon(
              Icons.notifications,
              color: _selectedIndex == 2
                  ? Colors.deepOrangeAccent
                  : Colors.white,
              size: 35,
            ),
            onPressed: () => _onItemTapped(2),
          ),

          IconButton(
            icon: Icon(
              Icons.person,
              color: _selectedIndex == 3
                  ? Colors.deepOrangeAccent
                  : Colors.white,
              size: 40,
            ),
            onPressed: () => _onItemTapped(3),
          ),

        ],
      ),
    );
  }
}
