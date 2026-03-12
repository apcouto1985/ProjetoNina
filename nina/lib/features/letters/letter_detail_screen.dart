import 'package:flutter/material.dart';
import '../../app/routes.dart';
import '../../shared/theme/nina_theme.dart';
import '../../core/i18n/letter_data.dart';

class LetterDetailScreen extends StatelessWidget {
  final String letter;

  const LetterDetailScreen({super.key, required this.letter});

  @override
  Widget build(BuildContext context) {
    final data = LetterData.getByLetter(letter);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded, size: 28),
                  ),
                  Text(
                    'LETRA ${data.letter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Letter display
            Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: NinaColors.primary.withValues(alpha: 0.3),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: data.letter,
                        style: const TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.w800,
                          color: NinaColors.primary,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      TextSpan(
                        text: ' ${data.letter.toLowerCase()}',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w600,
                          color: NinaColors.primary.withValues(alpha: 0.6),
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Word association
            Text(data.emoji, style: const TextStyle(fontSize: 60)),
            const SizedBox(height: 8),
            Text(
              data.word.toUpperCase(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 24),

            // Nina speech
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Text('🚂', style: TextStyle(fontSize: 28)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${data.letter}! ${data.letter} de ${data.word}!',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Action buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // TODO: Play letter sound
                      },
                      icon: const Icon(Icons.volume_up_rounded),
                      label: const Text('Ouvir'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(0, 56),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        NinaRoutes.letterTracing,
                        arguments: data.letter,
                      ),
                      icon: const Icon(Icons.edit_rounded),
                      label: const Text('Traçar'),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pushNamed(
                    context,
                    NinaRoutes.letterQuiz,
                    arguments: data.letter,
                  ),
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text('Jogar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: NinaColors.success,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
