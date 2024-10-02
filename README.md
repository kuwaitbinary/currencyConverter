# Flutter Currency Converter

A Flutter application for converting currencies, viewing historical exchange rate data, and showing supported currencies.

## Instructions on How to Build the Project

1. **Clone the repository:**
   ```bash
   git clone https://github.com/kuwaitbinary/currencyConverter.git
   
2. **Navigate to the project directory:** 
   cd flutter_currency_converter

3.  **Install dependencies:** 
   flutter pub get

4.  **Run the application:** 
   flutter run


**Adapted Design Pattern for the App Architecture:**
The app follows the Clean Architecture pattern, which ensures a clear separation of concerns and makes the codebase more maintainable and testable.

**Layers:**
**Data Layer:**

Contains data sources (remote and local) and repositories.
Responsible for fetching data from APIs and local databases.

**Domain Layer:**

Contains business logic and use cases.
Interacts with repositories to fetch and manipulate data.

**Presentation Layer:**

It contains the UI code and state management (using Bloc).
Uses events and states to manage the UI.

**Justification:** Clean Architecture helps in managing complex applications by breaking down the app into distinct layers, each with a specific responsibility. This makes the app easier to test, maintain, and extend.

**Adapted Image Loader Library:**
The app uses the cached_network_image library to load and cache images.

**Justification:** The cached_network_image library provides an efficient way to load images from the network and cache them locally. This improves the app's performance by reducing the need to fetch images from the network repeatedly, especially for images like country flags that are frequently used.

**Used Database in the App:**
The app uses the sqflit database for local storage.

**Justification:** i chose sqflite for its reliability, performance, full-featured SQL support, offline capability, and ease of use, making it ideal for managing structured data and ensuring a seamless user experience in our app.

# code_challenge

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
