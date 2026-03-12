import 'package:flutter/material.dart';
import '../../app/routes.dart';
import '../../shared/theme/nina_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isMuted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  // Stars counter
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('⭐', style: TextStyle(fontSize: 20)),
                        const SizedBox(width: 4),
                        Text(
                          '0',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  // Mute button
                  IconButton(
                    onPressed: () => setState(() => _isMuted = !_isMuted),
                    icon: Icon(
                      _isMuted ? Icons.volume_off_rounded : Icons.volume_up_rounded,
                      color: NinaColors.textSecondary,
                      size: 28,
                    ),
                  ),
                  // Parent panel button
                  IconButton(
                    onPressed: () => Navigator.pushNamed(context, NinaRoutes.parentPanel),
                    icon: const Icon(
                      Icons.settings_rounded,
                      color: NinaColors.textSecondary,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Title
            Text(
              'ESTAÇÃO CENTRAL',
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 8),

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
                        'Olá! Para onde vamos hoje?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Menu cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.1,
                  children: [
                    _MenuCard(
                      icon: '🔤',
                      label: 'LETRAS',
                      color: NinaColors.wagonLetters,
                      onTap: () => Navigator.pushNamed(context, NinaRoutes.letterMap),
                    ),
                    _MenuCard(
                      icon: '🔢',
                      label: 'NÚMEROS',
                      color: NinaColors.wagonNumbers.withValues(alpha: 0.4),
                      subtitle: 'em breve',
                      onTap: null,
                    ),
                    _MenuCard(
                      icon: '⭐',
                      label: 'CONQUISTAS',
                      color: NinaColors.wagonRewards,
                      onTap: () {
                        // TODO: Navigate to achievements
                      },
                    ),
                    _MenuCard(
                      icon: '⚙️',
                      label: 'PAIS',
                      color: NinaColors.textSecondary,
                      onTap: () => Navigator.pushNamed(context, NinaRoutes.parentPanel),
                    ),
                  ],
                ),
              ),
            ),

            // Decorative tracks
            Container(
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: NinaColors.tracks,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class _MenuCard extends StatelessWidget {
  final String icon;
  final String label;
  final Color color;
  final String? subtitle;
  final VoidCallback? onTap;

  const _MenuCard({
    required this.icon,
    required this.label,
    required this.color,
    this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color, width: 3),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(icon, style: const TextStyle(fontSize: 40)),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: color,
                  ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: NinaColors.textSecondary,
                    ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
