import 'package:flutter/material.dart';
import '../database/db_helper.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DBHelper dbHelper = DBHelper();
  List<Map<String, dynamic>> cartItems = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    cartItems = await dbHelper.getCartItems();
    setState(() {});
  }

  double getTotalBill() {
    double total = 0.0;
    for (var item in cartItems) {
      total += (item["price"] * item["quantity"]);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: cartItems.isEmpty
          ? Center(
        child: Text(
          "No items in cart",
          style: TextStyle(color: Colors.white70, fontSize: 18),
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final coffee = cartItems[index];
                double totalCost =
                    coffee["price"] * coffee["quantity"]; // ✅ per-item cost

                return ListTile(
                  title: Text(
                    coffee["name"],
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "Qty: ${coffee["quantity"]} | Price: \$${coffee["price"]} | Total: \$${totalCost.toStringAsFixed(2)}",
                    style: TextStyle(color: Colors.white70),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      await dbHelper.deleteCartItem(coffee["id"]);
                      loadData();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Deleted ${coffee["name"]}"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),

          // ✅ Grand total at bottom
          Container(
            padding: EdgeInsets.all(20),
            color: Colors.deepOrangeAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Grand Total:",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                Text("\$${getTotalBill().toStringAsFixed(2)}",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}