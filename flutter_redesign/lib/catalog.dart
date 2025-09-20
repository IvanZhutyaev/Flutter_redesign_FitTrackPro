import 'package:flutter/material.dart';

class CatalogPage extends StatelessWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// Фон
          Image.asset("assets/catalog_background.jpg", fit: BoxFit.cover),

          /// Контент
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 8),

                  /// Аватар
                  Center(
                    child: Image.asset(
                      "assets/catalog_avatar.png",
                      width: 180,
                      height: 180,
                    ),
                  ),

                  const SizedBox(height: 8),

                  /// Карточки каталога
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: const [
                        _CatalogCard(
                          icon: Icons.person,
                          title: "Profile",
                          subtitle: "Personal data, goals, avatar",
                          iconColor: Colors.amber,
                        ),
                        SizedBox(height: 12),
                        _CatalogCard(
                          icon: Icons.fitness_center,
                          title: "Workouts",
                          subtitle: "Exercise catalog, create programs",
                          iconColor: Colors.orange,
                        ),
                        SizedBox(height: 12),
                        _CatalogCard(
                          icon: Icons.directions_walk,
                          title: "Activity",
                          subtitle: "Step counting, activity charts",
                          iconColor: Colors.green,
                        ),
                        SizedBox(height: 12),
                        _CatalogCard(
                          icon: Icons.restaurant,
                          title: "Nutrition",
                          subtitle: "Food diary, calorie calculation",
                          iconColor: Colors.red,
                        ),
                        SizedBox(height: 12),
                        _CatalogCard(
                          icon: Icons.timeline,
                          title: "Progress",
                          subtitle: "Track your fitness progress",
                          iconColor: Colors.purple,
                        ),
                        SizedBox(height: 12),
                        _CatalogCard(
                          icon: Icons.settings,
                          title: "Settings",
                          subtitle: "App preferences and configuration",
                          iconColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Виджет карточки
class _CatalogCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  const _CatalogCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 30, color: iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
