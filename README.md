# ☕ Coffee Shop Flutter App

A modern **Coffee Shop mobile application** built using **Flutter**.
The application allows users to browse coffee items, search for products, view detailed coffee information, add items to cart, mark favorites, and manage orders.

The project also integrates a **local database using SQLite** to store coffee data, cart items, and favorite selections.

---

# 📱 Features

### 🔍 Search Coffee

Users can search coffee items using the search bar.

### ☕ Coffee Categories

Coffee items are organized into categories:

* All Coffee
* Cold Coffee
* Hot Coffee
* Americano
* Cappuccino

### 📄 Coffee Details

Clicking on any coffee item opens a **detailed page** showing the coffee information.

### 🛒 Add to Cart

Users can add coffee items to the cart.
Cart items are stored using the **local SQLite database**.

### ❤️ Favorites

Users can mark coffee items as favorites.

### ⭐ Favorites Navigation

The **Favorites section** shows all coffee items marked as favorites.

### 👤 Profile Section

The profile page displays:

* Ordered coffee items
* Quantity of each coffee
* Price of each coffee
* Total price of individual items
* Final total price of all ordered coffees

### 📂 Navigation Drawer

Includes:

* Home
* Favorites
* Notifications
* Profile

### 🧭 Bottom Navigation

Bottom navigation provides quick access to:

* Home
* Favorites
* Notifications
* Profile

### 🔔 Notifications

Displays a message when there are no new notifications.

---

# 🗄 Local Database Implementation

This project uses **SQLite** through the Flutter plugin **sqflite** to manage application data locally.

A database helper file:

```
lib/database/db_helper.dart
```

is used to handle database operations.

### Database Table

The application creates a table called:

```
coffee
```

with the following fields:

| Column     | Purpose                                   |
| ---------- | ----------------------------------------- |
| id         | Unique ID for each coffee item            |
| name       | Coffee name                               |
| price      | Coffee price                              |
| quantity   | Quantity of coffee ordered                |
| isFavorite | Indicates if coffee is marked as favorite |
| inCart     | Indicates if coffee is added to cart      |

### Database Functions

The database helper performs operations such as:

* Insert coffee items
* Store cart items
* Retrieve cart items
* Retrieve favorite items
* Toggle favorite status
* Delete cart items

This allows the app to **persist user selections even after closing the app**.

---

# 🛠 Technologies Used

* Flutter
* Dart
* Material UI
* SQLite
* sqflite plugin
* path_provider

---

# 📂 Project Structure

```
coffee_shop_app
│
├── lib
│   ├── database
│   │   └── db_helper.dart
│   │
│   ├── screens
│   │   ├── favorites_screen.dart
│   │   ├── home_screen.dart
│   │   ├── profile_screen.dart
│   │   ├── single_item_screen.dart
│   │   └── welcome_screen.dart
│   │
│   ├── widgets
│   │   ├── home_bottom_bar.dart
│   │   └── items_widget.dart
│   │
│   └── main.dart
│
├── android
├── ios
├── web
├── windows
├── macos
├── linux
│
├── pubspec.yaml
└── README.md
```

---

# 🚀 Getting Started

### Clone the Repository

```
git clone https://github.com/yourusername/coffee-shop-app.git
```

### Navigate to the Project

```
cd coffee-shop-app
```

### Install Dependencies

```
flutter pub get
```

### Run the App

```
flutter run
```

---

# 📦 Build APK

To generate the Android APK:

```
flutter build apk
```

APK location:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

# 🎯 Purpose of the Project

This project was developed to practice:

* Flutter UI development
* Mobile app navigation
* Local database integration using SQLite
* State handling in Flutter applications
* Building a realistic mobile shopping interface

---

# 👩‍💻 Author

**Kanishka S**
B.E Computer Science Engineering Student

---

# ⭐ Support

If you like this project, consider giving it a **star on GitHub ⭐**

