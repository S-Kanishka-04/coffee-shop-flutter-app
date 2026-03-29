# ☕ Coffee Shop Flutter App

A modern **Coffee Shop mobile application** built using **Flutter**.
The application allows users to browse coffee items, search for products, view detailed coffee information, add items to cart, mark favorites, and manage orders.

The project also integrates a **local database using SQLite** to store coffee data, cart items, and favorite selections.

---
## 📸 App Screens

### 🏠 Home Screen
<img width="716" height="1600" alt="image" src="https://github.com/user-attachments/assets/f06c9baf-1243-4b1d-90b6-5a5d133b8d5c" />

### ☕ Coffee Categories
<img width="716" height="1600" alt="image" src="https://github.com/user-attachments/assets/d62fd9ad-1926-4a4f-bbbf-090b8f60375b" />

### ❤️ Favorites Page
<img width="716" height="1600" alt="image" src="https://github.com/user-attachments/assets/38387699-80da-4ae8-b674-71efb1bf7507" />

### 👤 Profile Page
<img width="716" height="1600" alt="image" src="https://github.com/user-attachments/assets/21093eec-a73e-437b-8559-c228200a0cbd" />

### 📋 Navigation Drawer
<img width="716" height="1600" alt="image" src="https://github.com/user-attachments/assets/593c0f26-5fb4-4a5f-9b75-ec21662ac7c7" />

---
## 📱 Features

* ☕ Coffee menu with multiple categories
* 🔍 Search coffee items
* 🗂 Category tabs (All, Cold Coffee, Hot Coffee, Americano, Cappuccino)
* 📄 Click on coffee items to view detailed information
* 🛒 Add coffee to cart with quantity and price tracking
* ❤️ Mark coffee items as favorites
* ⭐ Favorites page showing all favorite coffee items
* 👤 Profile page showing cart items, quantities, individual prices, and total order price
* 🗄 Local database integration using SQLite to store cart and favorite items
* 📋 Navigation Drawer (Home, Favorites, Notifications, Profile)
* 🧭 Bottom navigation bar for quick access to sections
* 🔔 Notification alerts for user interactions
* 📱 Responsive mobile UI built with Flutter


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

