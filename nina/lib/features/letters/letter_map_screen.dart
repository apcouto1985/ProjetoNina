import 'package:flutter/material.dart';
import '../../app/routes.dart';
import '../../shared/theme/nina_theme.dart';
import '../../core/i18n/letter_data.dart';

class LetterMapScreen extends StatelessWidget {
  const LetterMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Load unlocked letters from storage
    const unlockedCount = 26; // All unlocked for now

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
                  Text('LETRAS', style: Theme.of(context).textTheme.headlineMedium),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('⭐', style: TextStyle(fontSize: 18)),
                        SizedBox(width: 4),
                        Text('0', style: TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Letter grid
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemCount: LetterData.alphabet.length,
                  itemBuilder: (context, index) {
                    final data = LetterData.alphabet[index];
                    final isUnlocked = index < unlockedCount;

                    return GestureDetector(
                      onTap: isUnlocked
                          ? () => Navigator.pushNamed(
                                context,
                                NinaRoutes.letterDetail,
                                arguments: data.letter,
                              )
                          : null,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isUnlocked ? Colors.white : Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: isUnlocked
                                ? NinaColors.primary
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: isUnlocked
                              ? [
                                  BoxShadow(
                                    color: NinaColors.primary.withValues(alpha: 0.2),
                                    blurRadius: 6,
                                    offset: const Offset(0, 3),
                                  ),
                                ]
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            data.letter,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w800,
                              color: isUnlocked
                                  ? NinaColors.textPrimary
                                  : Colors.grey.shade400,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Nina speech
            Padding(
              padding: const EdgeInsets.all(16),
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
                        'Escolha uma letra para aprender!',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
