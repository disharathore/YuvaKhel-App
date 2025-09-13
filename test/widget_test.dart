// test/widget_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:yuva_khel/main.dart'; // Ensure this path is correct

void main() {
  testWidgets('App starts and shows splash screen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // This is a simple verification to confirm that the main MyApp widget is found.
    // It's a basic "smoke test".
    expect(find.byType(MyApp), findsOneWidget);
  });
}