import 'package:flutter/material.dart';
import '../../app/routes.dart';
import '../../shared/theme/nina_theme.dart';
import '../../core/i18n/letter_data.dart';

class RewardScreen extends StatefulWidget {
  final String letter;

  const RewardScreen({super.key, required this.letter});

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = LetterData.getByLetter(widget.letter);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('🎉 🎊 🎉', style: TextStyle(fontSize: 48)),
                const SizedBox(height: 24),

                // Stars animation
                ScaleTransition(
                  scale: _scaleAnimation,
                  child: const Text('⭐ ⭐ ⭐', style: TextStyle(fontSize: 48)),
                ),
                const SizedBox(height: 16),
                Text(
                  'Você ganhou 3 estrelas!',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),

                const SizedBox(height: 32),

                // Nina speech
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Text('🚂', style: TextStyle(fontSize: 36)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Incrível! Você aprendeu a letra ${data.letter}!',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Wagon message
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: NinaColors.wagonLetters.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: NinaColors.wagonLetters.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${data.letter} adicionada ao vagão de letras!',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 8),
                      const Text('🚃', style: TextStyle(fontSize: 24)),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.popUntil(
                            context,
                            ModalRoute.withName(NinaRoutes.letterMap),
                          );
                          Navigator.pushNamed(
                            context,
                            NinaRoutes.letterDetail,
                            arguments: widget.letter,
                          );
                        },
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('Repetir'),
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
                        onPressed: () {
                          // Navigate to next letter or back to map
                          final currentIndex = LetterData.alphabet
                              .indexWhere((l) => l.letter == widget.letter);
                          if (currentIndex < LetterData.alphabet.length - 1) {
                            final nextLetter =
                                LetterData.alphabet[currentIndex + 1].letter;
                            Navigator.popUntil(
                              context,
                              ModalRoute.withName(NinaRoutes.letterMap),
                            );
                            Navigator.pushNamed(
                              context,
                              NinaRoutes.letterDetail,
                              arguments: nextLetter,
                            );
                          } else {
                            Navigator.popUntil(
                              context,
                              ModalRoute.withName(NinaRoutes.home),
                            );
                          }
                        },
                        icon: const Icon(Icons.arrow_forward_rounded),
                        label: const Text('Próxima'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
