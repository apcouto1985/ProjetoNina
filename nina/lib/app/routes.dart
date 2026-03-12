import 'package:flutter/material.dart';
import '../features/splash/splash_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/home/home_screen.dart';
import '../features/letters/letter_map_screen.dart';
import '../features/letters/letter_detail_screen.dart';
import '../features/letters/letter_tracing_screen.dart';
import '../features/letters/letter_quiz_screen.dart';
import '../features/rewards/reward_screen.dart';
import '../features/parent_panel/parent_panel_screen.dart';

class NinaRoutes {
  NinaRoutes._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String home = '/home';
  static const String letterMap = '/letters';
  static const String letterDetail = '/letters/detail';
  static const String letterTracing = '/letters/tracing';
  static const String letterQuiz = '/letters/quiz';
  static const String reward = '/reward';
  static const String parentPanel = '/parent';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRoute(const SplashScreen());
      case onboarding:
        return _buildRoute(const OnboardingScreen());
      case home:
        return _buildRoute(const HomeScreen());
      case letterMap:
        return _buildRoute(const LetterMapScreen());
      case letterDetail:
        final letter = settings.arguments as String;
        return _buildRoute(LetterDetailScreen(letter: letter));
      case letterTracing:
        final letter = settings.arguments as String;
        return _buildRoute(LetterTracingScreen(letter: letter));
      case letterQuiz:
        final letter = settings.arguments as String;
        return _buildRoute(LetterQuizScreen(letter: letter));
      case reward:
        final letter = settings.arguments as String;
        return _buildRoute(RewardScreen(letter: letter));
      case parentPanel:
        return _buildRoute(const ParentPanelScreen());
      default:
        return _buildRoute(const SplashScreen());
    }
  }

  static MaterialPageRoute _buildRoute(Widget page) {
    return MaterialPageRoute(builder: (_) => page);
  }
}
