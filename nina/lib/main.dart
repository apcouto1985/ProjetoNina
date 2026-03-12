import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/storage/nina_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NinaStorage.init();
  runApp(const NinaApp());
}
