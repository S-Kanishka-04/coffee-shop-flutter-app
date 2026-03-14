
import 'package:flutter/material.dart';
import '../widgets/home_bottom_bar.dart';
import '../widgets/items_widget.dart';
import 'favorites_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {

  late TabController _tabController;
  TextEditingController _searchController = TextEditingController();
  String searchQuery = "";

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);

    _searchController.addListener(() {
      setState(() {
        searchQuery = _searchController.text;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 30, 33, 35),

      // ✅ Navigation Drawer
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 30, 33, 35),
        child: ListView(
          children: [

            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepOrangeAccent),
              child: Text(
                "Coffee Shop",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),

            // HOME
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text("Home",
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            // FAVORITES
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.white),
              title: const Text("Favorites",
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => FavoritesScreen(),
                  ),
                );
              },
            ),

            // NOTIFICATIONS
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.white),
              title: const Text("Notifications",
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("No new notifications"),
                  ),
                );
              },
            ),

            // PROFILE
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text("Profile",
                  style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: ListView(
            children: [

              // Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    // MENU BUTTON
                    InkWell(
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      child: Icon(
                        Icons.sort_rounded,
                        size: 35,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),

                    // NOTIFICATION ICON
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("No new notifications")),
                        );
                      },
                      child: Icon(
                        Icons.notifications,
                        size: 35,
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "It's a Great Day for Coffee",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),

              // SEARCH BAR
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                height: 60,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 50, 54, 56),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search,
                        color: Colors.white.withOpacity(0.5)),
                    hintText: "Find Your Coffee",
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5)),
                  ),
                ),
              ),

              // TABS
              TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: Colors.deepOrangeAccent,
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3,
                    color: Colors.deepOrangeAccent,
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 16),
                ),
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                labelPadding:
                    const EdgeInsets.symmetric(horizontal: 20),
                tabs: const [
                  Tab(text: "All"),
                  Tab(text: "Cold Coffee"),
                  Tab(text: "Hot Coffee"),
                  Tab(text: "Americano"),
                  Tab(text: "Cappuccino"),
                ],
              ),

              const SizedBox(height: 10),

              // TAB VIEW
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ItemWidget(title: "All", searchQuery: searchQuery),
                    ItemWidget(title: "Cold Coffee", searchQuery: searchQuery),
                    ItemWidget(title: "Hot Coffee", searchQuery: searchQuery),
                    ItemWidget(title: "Americano", searchQuery: searchQuery),
                    ItemWidget(title: "Cappuccino", searchQuery: searchQuery),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
