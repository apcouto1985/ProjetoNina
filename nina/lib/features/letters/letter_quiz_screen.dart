import 'dart:math';
import 'package:flutter/material.dart';
import '../../app/routes.dart';
import '../../shared/theme/nina_theme.dart';
import '../../core/i18n/letter_data.dart';

class LetterQuizScreen extends StatefulWidget {
  final String letter;

  const LetterQuizScreen({super.key, required this.letter});

  @override
  State<LetterQuizScreen> createState() => _LetterQuizScreenState();
}

class _LetterQuizScreenState extends State<LetterQuizScreen> {
  late List<String> _options;
  int _attempts = 0;
  String? _selectedAnswer;
  bool? _isCorrect;

  @override
  void initState() {
    super.initState();
    _generateOptions();
  }

  void _generateOptions() {
    final random = Random();
    final allLetters = LetterData.alphabet.map((l) => l.letter).toList();
    allLetters.remove(widget.letter);
    allLetters.shuffle(random);

    _options = [widget.letter, ...allLetters.take(3)];
    _options.shuffle(random);
  }

  void _onAnswer(String answer) {
    if (_selectedAnswer != null) return;

    setState(() {
      _selectedAnswer = answer;
      _isCorrect = answer == widget.letter;
      _attempts++;
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      if (_isCorrect!) {
        Navigator.pushReplacementNamed(
          context,
          NinaRoutes.reward,
          arguments: widget.letter,
        );
      } else if (_attempts >= 2) {
        // Show correct answer then move on
        setState(() {
          _selectedAnswer = widget.letter;
          _isCorrect = true;
        });
        Future.delayed(const Duration(milliseconds: 1200), () {
          if (!mounted) return;
          Navigator.pushReplacementNamed(
            context,
            NinaRoutes.reward,
            arguments: widget.letter,
          );
        });
      } else {
        setState(() {
          _selectedAnswer = null;
          _isCorrect = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    'QUAL É A LETRA?',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Nina speech
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Container(
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
                        _isCorrect == true
                            ? 'Muito bem! Você acertou!'
                            : _isCorrect == false
                                ? 'Quase! Tente de novo!'
                                : 'Qual é a letra ${widget.letter}?',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Options grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: _options.map((option) {
                  Color bgColor = Colors.white;
                  Color borderColor = NinaColors.primary;

                  if (_selectedAnswer != null) {
                    if (option == widget.letter && _isCorrect == true) {
                      bgColor = NinaColors.success.withValues(alpha: 0.2);
                      borderColor = NinaColors.success;
                    } else if (option == _selectedAnswer && !_isCorrect!) {
                      bgColor = NinaColors.tryAgain.withValues(alpha: 0.2);
                      borderColor = NinaColors.tryAgain;
                    }
                  }

                  return GestureDetector(
                    onTap: () => _onAnswer(option),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: borderColor, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: borderColor.withValues(alpha: 0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          option,
                          style: TextStyle(
                            fontSize: 64,
                            fontWeight: FontWeight.w800,
                            color: NinaColors.textPrimary,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
