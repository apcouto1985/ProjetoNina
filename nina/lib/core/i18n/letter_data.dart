/// Letter data for Portuguese (BR).
class LetterData {
  final String letter;
  final String word;
  final String emoji;

  const LetterData({
    required this.letter,
    required this.word,
    required this.emoji,
  });

  static const List<LetterData> alphabet = [
    LetterData(letter: 'A', word: 'Abelha', emoji: '🐝'),
    LetterData(letter: 'B', word: 'Bola', emoji: '⚽'),
    LetterData(letter: 'C', word: 'Casa', emoji: '🏠'),
    LetterData(letter: 'D', word: 'Dado', emoji: '🎲'),
    LetterData(letter: 'E', word: 'Estrela', emoji: '⭐'),
    LetterData(letter: 'F', word: 'Flor', emoji: '🌸'),
    LetterData(letter: 'G', word: 'Gato', emoji: '🐱'),
    LetterData(letter: 'H', word: 'Hipopótamo', emoji: '🦛'),
    LetterData(letter: 'I', word: 'Iglu', emoji: '🏔️'),
    LetterData(letter: 'J', word: 'Jacaré', emoji: '🐊'),
    LetterData(letter: 'K', word: 'Kiwi', emoji: '🥝'),
    LetterData(letter: 'L', word: 'Lua', emoji: '🌙'),
    LetterData(letter: 'M', word: 'Macaco', emoji: '🐵'),
    LetterData(letter: 'N', word: 'Navio', emoji: '🚢'),
    LetterData(letter: 'O', word: 'Ovo', emoji: '🥚'),
    LetterData(letter: 'P', word: 'Pato', emoji: '🦆'),
    LetterData(letter: 'Q', word: 'Queijo', emoji: '🧀'),
    LetterData(letter: 'R', word: 'Rato', emoji: '🐭'),
    LetterData(letter: 'S', word: 'Sol', emoji: '☀️'),
    LetterData(letter: 'T', word: 'Tartaruga', emoji: '🐢'),
    LetterData(letter: 'U', word: 'Uva', emoji: '🍇'),
    LetterData(letter: 'V', word: 'Vaca', emoji: '🐄'),
    LetterData(letter: 'W', word: 'Waffle', emoji: '🧇'),
    LetterData(letter: 'X', word: 'Xícara', emoji: '☕'),
    LetterData(letter: 'Y', word: 'Yoga', emoji: '🧘'),
    LetterData(letter: 'Z', word: 'Zebra', emoji: '🦓'),
  ];

  static LetterData getByLetter(String letter) {
    return alphabet.firstWhere((l) => l.letter == letter.toUpperCase());
  }
}
