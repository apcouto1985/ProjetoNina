import 'package:flutter_test/flutter_test.dart';
import 'package:nina/app/app.dart';

void main() {
  testWidgets('App starts without errors', (tester) async {
    await tester.pumpWidget(const NinaApp());
    expect(find.text('NINA'), findsOneWidget);
  });
}
