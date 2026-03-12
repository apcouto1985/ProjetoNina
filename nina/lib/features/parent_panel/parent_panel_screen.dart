import 'package:flutter/material.dart';
import '../../shared/theme/nina_theme.dart';
import '../../core/storage/nina_storage.dart';

class ParentPanelScreen extends StatefulWidget {
  const ParentPanelScreen({super.key});

  @override
  State<ParentPanelScreen> createState() => _ParentPanelScreenState();
}

class _ParentPanelScreenState extends State<ParentPanelScreen> {
  bool _authenticated = false;
  final _pinController = TextEditingController();

  // Settings state
  bool _reduceAnimations = false;
  double _effectsVolume = 0.8;
  bool _backgroundMusic = true;
  bool _highContrast = false;
  int _timeLimitMinutes = 0;

  @override
  void initState() {
    super.initState();
    _reduceAnimations = NinaStorage.reduceAnimations;
    _effectsVolume = NinaStorage.effectsVolume;
    _backgroundMusic = NinaStorage.backgroundMusic;
    _highContrast = NinaStorage.highContrast;
    _timeLimitMinutes = NinaStorage.timeLimitMinutes;
  }

  void _checkPin() {
    if (_pinController.text == NinaStorage.pin) {
      setState(() => _authenticated = true);
    } else {
      _pinController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('PIN incorreto'),
          backgroundColor: NinaColors.tryAgain,
        ),
      );
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_rounded, size: 28),
                  ),
                  Text(
                    'PAINEL DOS PAIS',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: _authenticated ? _buildPanel() : _buildPinEntry(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinEntry() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock_rounded, size: 48, color: NinaColors.textSecondary),
            const SizedBox(height: 16),
            Text('Digite o PIN', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 24),
            SizedBox(
              width: 200,
              child: TextField(
                controller: _pinController,
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 4,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 32, letterSpacing: 16),
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (_) => _checkPin(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _checkPin,
              child: const Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Progress section
        _SectionCard(
          title: '📊 PROGRESSO',
          children: [
            _InfoRow(label: 'Letras aprendidas', value: '${NinaStorage.getLettersCompleted()} / 26'),
            _InfoRow(label: 'Estrelas', value: '${NinaStorage.getTotalStars()}'),
            _InfoRow(label: 'Tempo hoje', value: '${(NinaStorage.todayUsageSeconds / 60).round()} min'),
          ],
        ),
        const SizedBox(height: 16),

        // Time limit section
        _SectionCard(
          title: '⏱️ LIMITE DE TEMPO',
          children: [
            Text(
              'Sugestão de pausa (não bloqueia o app)',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: NinaColors.textSecondary,
                  ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              children: [0, 15, 30, 45, 60].map((minutes) {
                final isSelected = _timeLimitMinutes == minutes;
                return ChoiceChip(
                  label: Text(minutes == 0 ? 'Sem limite' : '$minutes min'),
                  selected: isSelected,
                  selectedColor: NinaColors.primary.withValues(alpha: 0.2),
                  onSelected: (_) {
                  setState(() => _timeLimitMinutes = minutes);
                  NinaStorage.setTimeLimitMinutes(minutes);
                },
                );
              }).toList(),
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Settings section
        _SectionCard(
          title: '⚙️ CONFIGURAÇÕES',
          children: [
            SwitchListTile(
              title: const Text('Reduzir animações'),
              value: _reduceAnimations,
              onChanged: (v) {
                setState(() => _reduceAnimations = v);
                NinaStorage.setReduceAnimations(v);
              },
              activeColor: NinaColors.primary,
              contentPadding: EdgeInsets.zero,
            ),
            Row(
              children: [
                const Expanded(child: Text('Volume dos sons')),
                Expanded(
                  child: Slider(
                    value: _effectsVolume,
                    onChanged: (v) {
                  setState(() => _effectsVolume = v);
                  NinaStorage.setEffectsVolume(v);
                },
                    activeColor: NinaColors.primary,
                  ),
                ),
              ],
            ),
            SwitchListTile(
              title: const Text('Música de fundo'),
              value: _backgroundMusic,
              onChanged: (v) {
                setState(() => _backgroundMusic = v);
                NinaStorage.setBackgroundMusic(v);
              },
              activeColor: NinaColors.primary,
              contentPadding: EdgeInsets.zero,
            ),
            SwitchListTile(
              title: const Text('Contraste alto'),
              value: _highContrast,
              onChanged: (v) {
                setState(() => _highContrast = v);
                NinaStorage.setHighContrast(v);
              },
              activeColor: NinaColors.primary,
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ],
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SectionCard({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyMedium),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
