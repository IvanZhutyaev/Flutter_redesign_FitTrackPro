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
    // Параметры, которые можно быстро настроить:
    const double navBarHeight = 80.0;
    const double fabDiameter = 64.0;
    const double fabRadius = fabDiameter / 2;
    const double greenPeek = 40.0; // сколько зелёного видно над нижней панелью
    final double beigeBottom = navBarHeight + greenPeek;

    return Scaffold(
      // Базовый фон — зелёный (нижний слой)
      body: Stack(
        children: [
          // 1) Зеленый фон (базовый)
          Container(color: const Color(0xFF446E67)),

          // 2) Оранжевая фигура (полукруг) снизу слева — расположена выше нижней панели
          Positioned(
            bottom: navBarHeight + 10, // находится над нижней панелью (не входит в неё)
            left: -80,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                color: const Color(0xFFD49A5D),
                borderRadius: BorderRadius.circular(200),
              ),
            ),
          ),

          // 3) Бежевый блок, который перекрывает ~90% экрана сверху
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: beigeBottom, // оставляем полосу (greenPeek) над нижней панелью
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFDFBF7),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // HEADER: текст + аватар (аватар визуально выше текста)
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // текстовая часть с отступом сверху
                          const Padding(
                            padding: EdgeInsets.only(top: 34, right: 80),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'FITNESS\nTRACKER',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                    height: 1.15,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  'Your personal trainer and nutritionist',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // аватарка — выше текста (Positioned top: 0)
                          Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: const Color(0xFFE0E0E0),
                              child: const Icon(Icons.person, size: 28, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 28),

                      // Длинная "Start Workout" кнопка (высокая)
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
                            elevation: 0,
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

                      // Вкладки: Steps слева, Workouts+Nutrition справа
                      Expanded(
                        child: Row(
                          children: [
                            // Steps (левая большая вертикальная карточка)
                            Expanded(
                              flex: 1,
                              child: _StepsCard(),
                            ),

                            const SizedBox(width: 16),

                            // Правая колонка: две карточки одна на другую, вместе равны высоте Steps
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: const [
                                  Expanded(
                                    child: _CardItem(
                                      title: 'Workouts',
                                      icon: Icons.fitness_center,
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Expanded(
                                    child: _CardItem(
                                      title: 'Nutrition',
                                      icon: Icons.local_pizza,
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
            ),
          ),

          // 4) Нижняя панель (внизу экрана)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: navBarHeight,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFDFBF7),
                boxShadow: [
                  BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, -2))
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
                  SizedBox(width: 60), // место под FAB
                  Icon(Icons.bar_chart, size: 28, color: Colors.black87),
                ],
              ),
            ),
          ),

          // 5) FAB — наполовину в нижней панели, наполовину над фоном
          Positioned(
            bottom: navBarHeight - fabRadius, // половина внутри нижней панели
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

/// Большая карточка Steps (левая)
class _StepsCard extends StatelessWidget {
  const _StepsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // чтобы карточка "не выходила" и соответствовала размерам
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2))],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.circle, size: 20, color: Color(0xFFD46C3B)),
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
    );
  }
}

/// Универсальная карточка (Workouts / Nutrition)
class _CardItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const _CardItem({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(2, 2))],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: const Color(0xFFD46C3B)),
          const SizedBox(height: 14),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
