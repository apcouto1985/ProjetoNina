import 'package:flutter/material.dart';
import '../shared/theme/nina_theme.dart';
import 'routes.dart';

class NinaApp extends StatelessWidget {
  const NinaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nina',
      debugShowCheckedModeBanner: false,
      theme: NinaTheme.theme,
      initialRoute: NinaRoutes.splash,
      onGenerateRoute: NinaRoutes.generateRoute,
    );
  }
}
