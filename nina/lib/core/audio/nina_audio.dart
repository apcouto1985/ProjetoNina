import 'package:flutter_tts/flutter_tts.dart';
import '../storage/nina_storage.dart';

/// Manages all audio output for the Nina app.
class NinaAudio {
  static final FlutterTts _tts = FlutterTts();
  static bool _initialized = false;

  static Future<void> init() async {
    if (_initialized) return;

    // Try to find the best PT-BR voice available
    final voices = await _tts.getVoices;
    if (voices is List) {
      // Prefer PT-BR female voices
      final ptBrVoices = voices.where((v) {
        final locale = (v['locale'] ?? '').toString().toLowerCase();
        return locale.contains('pt') && locale.contains('br');
      }).toList();

      if (ptBrVoices.isNotEmpty) {
        // Prefer female voice if available
        final female = ptBrVoices.where((v) {
          final name = (v['name'] ?? '').toString().toLowerCase();
          return name.contains('female') || name.contains('luciana') ||
                 name.contains('francisca') || name.contains('google') ||
                 name.contains('microsoft');
        });
        final chosen = female.isNotEmpty ? female.first : ptBrVoices.first;
        await _tts.setVoice({
          'name': chosen['name'].toString(),
          'locale': chosen['locale'].toString(),
        });
      } else {
        // Fallback: any Portuguese voice
        final ptVoices = voices.where((v) {
          final locale = (v['locale'] ?? '').toString().toLowerCase();
          return locale.contains('pt');
        }).toList();
        if (ptVoices.isNotEmpty) {
          await _tts.setVoice({
            'name': ptVoices.first['name'].toString(),
            'locale': ptVoices.first['locale'].toString(),
          });
        }
      }
    }

    await _tts.setLanguage('pt-BR');
    await _tts.setSpeechRate(0.4);
    await _tts.setPitch(1.2);
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
