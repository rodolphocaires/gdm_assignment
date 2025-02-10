import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/moteis/presentation/widget/unavailable_card.dart';

void main() {
  group('UnavailableCard Widget Tests', () {
    testWidgets('displays "indisponível no app" text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UnavailableCard(),
          ),
        ),
      );

      expect(find.text('indisponível no app'), findsOneWidget);
    });

    testWidgets('displays "avise-me" button with correct text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UnavailableCard(),
          ),
        ),
      );

      expect(find.text('avise-me'), findsOneWidget);
    });

    testWidgets('displays notification icon inside the "avise-me" button',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: UnavailableCard(),
          ),
        ),
      );

      final iconFinder = find.byIcon(Icons.notifications_outlined);
      expect(iconFinder, findsOneWidget);
    });
  });
}
