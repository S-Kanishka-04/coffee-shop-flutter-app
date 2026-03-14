import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../database/db_helper.dart';

class SingleItemScreen extends StatefulWidget {
  final String img;
  SingleItemScreen(this.img);

  @override
  _SingleItemScreenState createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  DBHelper dbHelper = DBHelper();
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),

                SizedBox(height: 50),

                // Coffee image
                Center(
                  child: Image.asset(
                    'assets/images/${widget.img}.png',
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                ),

                SizedBox(height: 30),

                // Coffee details
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("BEST COFFEE",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              letterSpacing: 3)),

                      SizedBox(height: 20),

                      Text(widget.img,
                          style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 1,
                              color: Colors.white)),

                      SizedBox(height: 25),

                      // Quantity selector + Price
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            width: 120,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white.withOpacity(0.4),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  },
                                  child: Icon(CupertinoIcons.minus,
                                      size: 18, color: Colors.white),
                                ),
                                SizedBox(width: 15),
                                Text("$quantity",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500)),
                                SizedBox(width: 15),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  child: Icon(CupertinoIcons.plus,
                                      size: 18, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Text("\$30",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ],
                      ),

                      SizedBox(height: 20),

                      Text(
                        "Coffee is a major source of antioxidants in the diet. It has many healthy benefits.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withOpacity(0.4),
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 40),

                      // Add to cart + Favorite widgets
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              await dbHelper.insertCoffee(
                                widget.img,
                                30.0,
                                quantity,
                                inCart: true, // ✅ saved as cart item
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Added to cart!"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 50),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 50, 54, 56),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text("Add to cart",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      letterSpacing: 1)),
                            ),
                          ),

                          InkWell(
                            onTap: () async {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                              await dbHelper.insertCoffee(
                                widget.img,
                                30.0,
                                quantity,
                                fav: isFavorite, // ✅ saved as favorite
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(isFavorite
                                      ? "Added to favorites!"
                                      : "Removed from favorites!"),
                                  backgroundColor: Colors.deepOrangeAccent,
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.deepOrangeAccent,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}