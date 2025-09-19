import 'package:flutter/material.dart';

void main() => runApp(const FitnessApp());

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const double navBarHeight = 80.0;
    const double fabDiameter = 64.0;
    const double fabRadius = fabDiameter / 2;

    return Scaffold(
      body: Stack(
        children: [
          /// 📷 ФОНОВОЕ ФОТО
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Контент
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 34, right: 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const _OutlinedText(
                              text: 'FITNESS\nTRACKER',
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                            ),
                            const SizedBox(height: 6),
                            const _OutlinedText(
                              text: 'Your personal trainer and nutritionist',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: -15,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundColor: Colors.white,
                          child: const Icon(
                            Icons.person,
                            size: 28,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // Кнопка Start Workout
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 28),
                        backgroundColor: const Color(0xFFD49A5D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        elevation: 4,
                      ),
                      child: const Text(
                        'Start Workout',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // 📊 КАРТОЧКИ
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Steps карточка
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(2, 2),
                                ),
                              ],
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.circle,
                                  size: 32,
                                  color: Color(0xFFD46C3B),
                                ),
                                SizedBox(height: 14),
                                Text(
                                  '7,120',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'steps',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // Workouts + Nutrition
                        Expanded(
                          child: Column(
                            children: [
                              // Workouts
                              Container(
                                height: 140,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.fitness_center,
                                      size: 32,
                                      color: Color(0xFFD46C3B),
                                    ),
                                    SizedBox(height: 14),
                                    Text(
                                      'Workouts',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Nutrition
                              Container(
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(2, 2),
                                    ),
                                  ],
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.local_pizza,
                                      size: 32,
                                      color: Color(0xFFD46C3B),
                                    ),
                                    SizedBox(height: 14),
                                    Text(
                                      'Nutrition',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// ⚪ Нижняя панель
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: navBarHeight,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFDFBF7),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, -2),
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Icon(Icons.home, size: 28, color: Colors.black87),
                  SizedBox(width: 60),
                  Icon(Icons.bar_chart, size: 28, color: Colors.black87),
                ],
              ),
            ),
          ),

          /// ➕ FAB (наполовину в панели)
          Positioned(
            bottom: navBarHeight - fabRadius,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: fabDiameter,
                height: fabDiameter,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: const Color(0xFF446E67),
                  child: const Icon(Icons.add, size: 32, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔤 Виджет с белым текстом + чёрная обводка
class _OutlinedText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const _OutlinedText({
    required this.text,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 2
              ..color = Colors.black,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
