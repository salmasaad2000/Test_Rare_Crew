# RareCrew Flutter Application

![Flutter](https://img.shields.io/badge/Flutter-3.19.5-blue)
![Firebase](https://img.shields.io/badge/Firebase-Cloud_Auth-orange)
![Riverpod](https://img.shields.io/badge/State_Management-Riverpod-green)

A Flutter application implementing Firebase authentication with local CRUD operations using MVVM architecture and Riverpod state management.

## Features

- 🔐 Firebase email/password authentication
- 📊 Dashboard with bottom navigation
- ➕ Add/Edit/Delete items (local storage)
- 👤 User profile with logout functionality
- ♻️ Riverpod state management
- 🏗️ MVVM architecture pattern

## Project Structure
lib/
├── models/
│ ├── user_model.dart
│ └── item_model.dart
├── view_models/
│ ├── auth_view_model.dart
│ ├── item_view_model.dart
│ └── profile_view_model.dart
├── views/
│ ├── auth/
│ │ └── login_screen.dart
│ ├── home/
│ │ ├── home_screen.dart
│ │ ├── add_edit_item_dialog.dart
│ │ └── item_list.dart
│ ├── profile/
│ │ └── profile_screen.dart
│ └── main_screen.dart
├── services/
│ └── auth_service.dart
└── main.dart

## Getting Started

### Prerequisites

- Flutter SDK (>=3.19.5)
- Dart (>=3.3.0)
- Firebase project with Authentication enabled
- Java JDK 17

### Installation

1. **Clone repository**
   ```bash
   git clone https://github.com/salmasaad2000/Test_Rare_Crew.git
   cd rarecrew"# Test_Rare_Crew" 
