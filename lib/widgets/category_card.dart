import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final VoidCallback onTap;

  const CategoryCard({required this.category, required this.onTap, Key? key}) : super(key: key);

  IconData _getIconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'electronics':
        return Icons.devices_other;
      case "men's clothing":
        return Icons.male;
      case "women's clothing":
        return Icons.female;
      case 'jewelery':
        return Icons.diamond;
      default:
        return Icons.category;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.orange[100],
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                _getIconForCategory(category),
                size: 30,
                color: Colors.orange[800],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  category.toUpperCase(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
