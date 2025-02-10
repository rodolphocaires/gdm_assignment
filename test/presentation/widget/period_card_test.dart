import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/moteis/domain/entity/suite.dart';
import 'package:gdm_assignment/moteis/presentation/widget/period_card.dart';
import 'package:intl/intl.dart';

void main() {
  group('PeriodCard Widget Tests', () {
    testWidgets('displays period card with correct data',
        (WidgetTester tester) async {
      final suite = Suite(
        nome: 'Suite 1',
        qtd: 1,
        exibirQtdDisponiveis: true,
        fotos: [],
        itens: [],
        categoriaItens: [],
        periodos: [
          Periodo(
            tempoFormatado: '1 Hora',
            tempo: '1h',
            valor: 100.0,
            valorTotal: 100.0,
            temCortesia: false,
            desconto: 0.0,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PeriodCard(suite: suite),
          ),
        ),
      );

      expect(find.text('1 Hora'), findsOneWidget);
      expect(
          find.text(NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
              .format(100.0)),
          findsOneWidget);
    });

    testWidgets(
        'displays multiple period cards when there are multiple periods',
        (WidgetTester tester) async {
      final suite = Suite(
        nome: 'Suite 1',
        qtd: 1,
        exibirQtdDisponiveis: true,
        fotos: [],
        itens: [],
        categoriaItens: [],
        periodos: [
          Periodo(
            tempoFormatado: '1 Hora',
            tempo: '1h',
            valor: 100.0,
            valorTotal: 100.0,
            temCortesia: false,
            desconto: 0.0,
          ),
          Periodo(
            tempoFormatado: '2 Horas',
            tempo: '2h',
            valor: 150.0,
            valorTotal: 150.0,
            temCortesia: true,
            desconto: 0.0,
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PeriodCard(suite: suite),
          ),
        ),
      );

      expect(find.text('1 Hora'), findsOneWidget);
      expect(
          find.text(NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
              .format(100.0)),
          findsOneWidget);
      expect(find.text('2 Horas'), findsOneWidget);
      expect(
          find.text(NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
              .format(150.0)),
          findsOneWidget);
    });

    testWidgets('displays empty when there are no periods',
        (WidgetTester tester) async {
      final suite = Suite(
        nome: 'Suite 1',
        qtd: 1,
        exibirQtdDisponiveis: true,
        fotos: [],
        itens: [],
        categoriaItens: [],
        periodos: [],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PeriodCard(suite: suite),
          ),
        ),
      );

      expect(find.byType(Card), findsNothing);
    });
  });
}
