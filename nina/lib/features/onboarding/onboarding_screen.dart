import 'package:flutter/material.dart';
import '../../app/routes.dart';
import '../../shared/theme/nina_theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  final _nameController = TextEditingController();
  int _currentPage = 0;
  String _childName = '';

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage == 0) {
      final name = _nameController.text.trim();
      if (name.isEmpty) return;
      setState(() => _childName = name);
    }
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // TODO: Save child name and onboarding completed flag
      Navigator.pushReplacementNamed(context, NinaRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: List.generate(4, (i) {
                  return Expanded(
                    child: Container(
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        color: i <= _currentPage
                            ? NinaColors.primary
                            : NinaColors.primary.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _currentPage = i),
                children: [
                  _buildNamePage(),
                  _buildWelcomePage(),
                  _buildLetterDemoPage(),
                  _buildTracingDemoPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNamePage() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('🚂', style: TextStyle(fontSize: 80)),
          const SizedBox(height: 24),
          Text(
            'Olá! Eu sou a Nina!\nQual é o seu nome?',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          TextField(
            controller: _nameController,
            textAlign: TextAlign.center,
            textCapitalization: TextCapitalization.words,
            style: Theme.of(context).textTheme.headlineMedium,
            decoration: InputDecoration(
              hintText: 'Digite seu nome',
              hintStyle: TextStyle(color: NinaColors.textSecondary.withValues(alpha: 0.5)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            ),
            onSubmitted: (_) => _nextPage(),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: _nextPage,
            child: const Text('Próximo ▶'),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomePage() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('🚂', style: TextStyle(fontSize: 80)),
          const SizedBox(height: 24),
          Text(
            'Que legal, $_childName!',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Eu sou um trenzinho e vou\nte ajudar a aprender as letras!',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: _nextPage,
            child: const Text('Próximo ▶'),
          ),
        ],
      ),
    );
  }

  Widget _buildLetterDemoPage() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '🚂 "Olha, essa é a letra A!"',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: NinaColors.primary.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'A',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 100,
                      color: NinaColors.primary,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Toque na letra para\nouvir o som dela!',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: _nextPage,
            child: const Text('Próximo ▶'),
          ),
        ],
      ),
    );
  }

  Widget _buildTracingDemoPage() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '🚂 "Agora tente desenhar!"',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: NinaColors.primary.withValues(alpha: 0.3),
                width: 3,
                strokeAlign: BorderSide.strokeAlignInside,
              ),
            ),
            child: Center(
              child: Text(
                'A',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w300,
                  color: NinaColors.textSecondary.withValues(alpha: 0.3),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Siga os pontinhos com\no dedo! Assim!',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          ElevatedButton(
            onPressed: _nextPage,
            child: const Text('🚀 Vamos começar!'),
          ),
        ],
      ),
    );
  }
}
