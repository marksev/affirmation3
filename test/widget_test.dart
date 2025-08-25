// import 'package:flutter/material.dart'; // Commented out unused import
import 'package:flutter_test/flutter_test.dart';

import 'package:affirmation_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const AffirmationApp());

    // Verify that we have a grid of categories on the home screen.
    expect(find.text('Daily Affirmations'), findsOneWidget);
    expect(find.text('Love'), findsOneWidget);
    expect(find.text('Confidence'), findsOneWidget);
    expect(find.text('Health'), findsOneWidget);
    expect(find.text('Wealth'), findsOneWidget);
  });
}