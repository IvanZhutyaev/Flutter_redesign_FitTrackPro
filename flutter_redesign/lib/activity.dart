import 'package:flutter/material.dart';

void main() {
  runApp(const ActivityApp());
}

class ActivityApp extends StatelessWidget {
  const ActivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.transparent,
        fontFamily: 'Roboto',
      ),
      home: const ActivityPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  // Цвета подобраны под картинку (примерно)
  static const Color cream = Color(0xFFFBF5E6);
  static const Color deepGreen = Color(0xFF0F2E2A);
  static const Color softYellow = Color(0xFFF7E9B9);
  static const Color accentOrange = Color(0xFFDE6A14);
  static const Color paleBox = Color(0xFFFFF7E0);

  @override
  Widget build(BuildContext context) {
    // Размеры рассчитываем от ширины экрана, чтобы поведение было предсказуемым
    final w = MediaQuery.of(context).size.width;
    final horizontalPadding = 20.0;

    return Scaffold(
      // фон берём из assets
      body: Stack(
        children: [
          // background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/activitybg.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  // Заголовок и иконка
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // маленький человек (иконка)
                      Container(
                        width: 36,
                        height: 36,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.directions_walk_rounded,
                          size: 26,
                          color: deepGreen,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Activity',
                        style: TextStyle(
                          color: deepGreen,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  // Карточки Steps / Distance / Calories
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _StatCard(
                        title: 'Steps',
                        value: '0',
                        width: (w - horizontalPadding * 2 - 24) / 3,
                      ),
                      _StatCard(
                        title: 'Distance',
                        value: '0 km',
                        width: (w - horizontalPadding * 2 - 24) / 3,
                      ),
                      _StatCard(
                        title: 'Calories',
                        value: '0',
                        width: (w - horizontalPadding * 2 - 24) / 3,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Text "0 steps of 70,000" and Progress bar and percent
                  Text(
                    '0 steps of 70,000',
                    style: TextStyle(
                      color: deepGreen,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // custom thin progress indicator
                  Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: paleBox,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.0, // 0% progress in the image
                      child: Container(
                        decoration: BoxDecoration(
                          color: accentOrange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text('0%', style: TextStyle(color: deepGreen, fontSize: 14)),
                  const SizedBox(height: 18),
                  // Activity Charts card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: cream.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: deepGreen.withOpacity(0.25),
                        width: 1.6,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Activity Charts',
                          style: TextStyle(
                            color: deepGreen,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Search/select period
                        Container(
                          decoration: BoxDecoration(
                            color: softYellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: deepGreen.withOpacity(0.7),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Select period',
                                style: TextStyle(
                                  color: deepGreen.withOpacity(0.75),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Empty chart area (pale rectangle)
                        Container(
                          height: 110,
                          decoration: BoxDecoration(
                            color: softYellow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Day / Week buttons
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  side: BorderSide(
                                    color: deepGreen.withOpacity(0.2),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                ),
                                child: Text(
                                  'Day',
                                  style: TextStyle(
                                    color: deepGreen,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  side: BorderSide(
                                    color: deepGreen.withOpacity(0.2),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                ),
                                child: Text(
                                  'Week',
                                  style: TextStyle(
                                    color: deepGreen,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Spacer to push bottom elements down
                  const Spacer(),
                  // Bottom Sync Google Fit + toggle on the right
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0, right: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left column text
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sync',
                              style: TextStyle(
                                color: deepGreen,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Google Fit',
                              style: TextStyle(
                                color: deepGreen,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        // Toggle (orange background with white circular thumb)
                        Container(
                          width: 64,
                          height: 36,
                          decoration: BoxDecoration(
                            color: accentOrange,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 6,
                          ),
                          child: Align(
                            alignment: Alignment
                                .centerRight, // toggle to the right (ON)
                            child: Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(999),
                              ),
                            ),
                          ),
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

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final double width;
  const _StatCard({
    required this.title,
    required this.value,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final Color deepGreen = const Color(0xFF0F2E2A);
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.92),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: deepGreen.withOpacity(0.25), width: 1.4),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: deepGreen.withOpacity(0.9),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: deepGreen,
              fontSize: 28,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
