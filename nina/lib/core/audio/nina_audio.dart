import 'package:flutter_tts/flutter_tts.dart';
import '../storage/nina_storage.dart';

/// Manages all audio output for the Nina app.
class NinaAudio {
  static final FlutterTts _tts = FlutterTts();
  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;
    await _tts.setLanguage('pt-BR');
    await _tts.setSpeechRate(0.4);
    await _tts.setPitch(1.3);
    _initialized = true;
  }

  /// Speak text using TTS. Respects mute setting.
  static Future<void> speak(String text) async {
    if (NinaStorage.isMuted) return;
    await init();
    await _tts.setVolume(NinaStorage.effectsVolume);
    await _tts.speak(text);
  }

  /// Speak the phonetic sound of a letter.
  static Future<void> speakLetter(String letter, String word) async {
    await speak('$letter! $letter de $word!');
  }

  /// Speak a feedback phrase.
  static Future<void> speakSuccess() async {
    await speak('Muito bem! Você acertou!');
  }

  static Future<void> speakTryAgain() async {
    await speak('Quase! Tente de novo!');
  }

  static Future<void> speakReward(String letter) async {
    await speak('Incrível! Você aprendeu a letra $letter!');
  }

  static Future<void> speakWelcome(String name) async {
    await speak('Olá, $name! Para onde vamos hoje?');
  }

  static Future<void> stop() async {
    await _tts.stop();
  }
}
