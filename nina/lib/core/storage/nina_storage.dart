import 'package:shared_preferences/shared_preferences.dart';

/// Manages all local persistence for the Nina app.
class NinaStorage {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // --- Onboarding ---

  static bool get onboardingCompleted => _prefs.getBool('onboarding_completed') ?? false;
  static Future<void> setOnboardingCompleted() => _prefs.setBool('onboarding_completed', true);

  static String get childName => _prefs.getString('child_name') ?? '';
  static Future<void> setChildName(String name) => _prefs.setString('child_name', name);

  // --- Stars ---

  /// Returns stars earned for a specific letter activity.
  /// Keys: "stars_{letter}_know", "stars_{letter}_trace", "stars_{letter}_quiz"
  static bool getStarEarned(String letter, String activity) {
    return _prefs.getBool('stars_${letter}_$activity') ?? false;
  }

  static Future<void> setStarEarned(String letter, String activity) {
    return _prefs.setBool('stars_${letter}_$activity', true);
  }

  static int getTotalStars() {
    int total = 0;
    for (final key in _prefs.getKeys()) {
      if (key.startsWith('stars_') && _prefs.getBool(key) == true) {
        total++;
      }
    }
    return total;
  }

  static int getStarsForLetter(String letter) {
    int count = 0;
    for (final activity in ['know', 'trace', 'quiz']) {
      if (getStarEarned(letter, activity)) count++;
    }
    return count;
  }

  static int getLettersCompleted() {
    int count = 0;
    for (int i = 0; i < 26; i++) {
      final letter = String.fromCharCode(65 + i); // A-Z
      if (getStarsForLetter(letter) > 0) count++;
    }
    return count;
  }

  // --- Conquistas ---

  static bool getAchievement(String id) => _prefs.getBool('achievement_$id') ?? false;
  static Future<void> setAchievement(String id) => _prefs.setBool('achievement_$id', true);

  static List<String> checkNewAchievements() {
    final newAchievements = <String>[];
    final completed = getLettersCompleted();

    if (completed >= 1 && !getAchievement('first_trip')) {
      setAchievement('first_trip');
      newAchievements.add('Primeira Viagem 🚂');
    }

    // Check vowels
    final vowels = ['A', 'E', 'I', 'O', 'U'];
    final allVowels = vowels.every((v) => getStarsForLetter(v) > 0);
    if (allVowels && !getAchievement('vowels')) {
      setAchievement('vowels');
      newAchievements.add('Vogais Completas 🌟');
    }

    if (completed >= 26 && !getAchievement('alphabet')) {
      setAchievement('alphabet');
      newAchievements.add('Alfabeto Completo 🏆');
    }

    return newAchievements;
  }

  // --- Settings ---

  static bool get isMuted => _prefs.getBool('is_muted') ?? false;
  static Future<void> setMuted(bool value) => _prefs.setBool('is_muted', value);

  static bool get reduceAnimations => _prefs.getBool('reduce_animations') ?? false;
  static Future<void> setReduceAnimations(bool value) => _prefs.setBool('reduce_animations', value);

  static double get effectsVolume => _prefs.getDouble('effects_volume') ?? 0.8;
  static Future<void> setEffectsVolume(double value) => _prefs.setDouble('effects_volume', value);

  static bool get backgroundMusic => _prefs.getBool('background_music') ?? true;
  static Future<void> setBackgroundMusic(bool value) => _prefs.setBool('background_music', value);

  static bool get highContrast => _prefs.getBool('high_contrast') ?? false;
  static Future<void> setHighContrast(bool value) => _prefs.setBool('high_contrast', value);

  static int get timeLimitMinutes => _prefs.getInt('time_limit_minutes') ?? 0;
  static Future<void> setTimeLimitMinutes(int value) => _prefs.setInt('time_limit_minutes', value);

  static String get pin => _prefs.getString('parent_pin') ?? '0000';
  static Future<void> setPin(String value) => _prefs.setString('parent_pin', value);

  // --- Session ---

  static int get todayUsageSeconds => _prefs.getInt(_todayKey) ?? 0;
  static Future<void> addUsageSeconds(int seconds) =>
      _prefs.setInt(_todayKey, todayUsageSeconds + seconds);

  static String get _todayKey {
    final now = DateTime.now();
    return 'usage_${now.year}_${now.month}_${now.day}';
  }
}
