import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

class StepService {
  static final StepService _instance = StepService._internal();
  factory StepService() => _instance;
  StepService._internal();

  late Stream<StepCount> _stepCountStream;
  int _steps = 0;

  int get steps => _steps;

  Future<void> initialize() async {
    // Запрос разрешения
    final status = await Permission.activityRecognition.request();
    if (!status.isGranted) {
      throw Exception('Step tracking permission denied');
    }

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(_onStepCount);

    // Получение начального значения
    try {
      final initialStepCount = await Pedometer.stepCountStream.first;
      _onStepCount(initialStepCount);
    } catch (e) {
      print('Error getting initial step count: $e');
    }
  }

  void _onStepCount(StepCount event) {
    _steps = event.steps;
    print('Steps updated: $_steps');
  }

  void dispose() {
    // Поток автоматически закроется
  }
}