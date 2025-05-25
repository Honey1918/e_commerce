import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/category_products_screen.dart';
import 'screens/product_details_screen.dart';
import 'screens/cart_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => SplashScreen(),
  '/login': (context) => LoginScreen(),
  '/dashboard': (context) => DashboardScreen(),
  '/category-products': (context) => CategoryProductsScreen(),
  '/product-details': (context) => ProductDetailsScreen(),
  '/cart': (context) => CartScreen(),
};