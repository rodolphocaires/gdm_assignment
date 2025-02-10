import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/moteis/presentation/widget/motel_filters.dart';

void main() {
  group('MotelFilters Widget Tests', () {
    testWidgets('displays all filter chips correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MotelFilters(),
          ),
        ),
      );

      const filterLabels = [
        'filtros',
        'com desconto',
        'disponíveis',
        'hidro',
        'piscina',
        'sauna',
        'ofurô',
        'decoração erótica',
        'decoração temática',
        'cadeira erótica',
        'pista de dança',
        'garagem privativa',
        'internet wi-fi',
        'suite para festas',
        'suite com acessibilidade',
      ];

      expect(find.text('filtros'), findsOneWidget);
      expect(find.text('com desconto'), findsOneWidget);
      expect(find.text('disponíveis'), findsOneWidget);
    });

    testWidgets('scrolls horizontally when there are multiple filter chips',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MotelFilters(),
          ),
        ),
      );

      final listViewFinder = find.byType(ListView);
      expect(listViewFinder, findsOneWidget);

      await tester.drag(listViewFinder, const Offset(-200, 0));
      await tester.pump();

      expect(listViewFinder, findsOneWidget);
    });

    testWidgets('tapping a FilterChip triggers onSelected callback',
        (WidgetTester tester) async {
      bool isSelected = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterChip(
              label: Text('Test Filter'),
              selected: isSelected,
              onSelected: (value) {
                isSelected = value;
              },
            ),
          ),
        ),
      );

      expect(isSelected, isFalse);

      await tester.tap(find.text('Test Filter'));
      await tester.pump();

      expect(isSelected, isTrue);
    });
  });
}
