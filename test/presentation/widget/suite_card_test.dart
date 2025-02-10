import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/moteis/domain/entity/suite.dart';
import 'package:gdm_assignment/moteis/presentation/widget/suite_card.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('SuiteCard Widget Tests', () {
    testWidgets('displays suite name and image correctly',
        (WidgetTester tester) async {
      final suite = Suite(
        nome: 'Suite Luxo',
        qtd: 5,
        exibirQtdDisponiveis: true,
        fotos: ['https://example.com/suite.jpg'],
        itens: [],
        categoriaItens: [],
        periodos: [],
      );

      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SuiteCard(suite: suite),
            ),
          ),
        );

        expect(find.text('Suite Luxo'), findsOneWidget);

        final imageFinder = find.byType(Image);
        expect(imageFinder, findsOneWidget);
        final imageWidget = tester.widget(imageFinder) as Image;
        expect(imageWidget.image, isInstanceOf<NetworkImage>());
        expect((imageWidget.image as NetworkImage).url,
            'https://example.com/suite.jpg');
      });
    });

    testWidgets('displays "only X available" when exibirQtdDisponiveis is true',
        (WidgetTester tester) async {
      final suite = Suite(
        nome: 'Suite Luxo',
        qtd: 5,
        exibirQtdDisponiveis: true,
        fotos: ['https://example.com/suite.jpg'],
        itens: [],
        categoriaItens: [],
        periodos: [],
      );

      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SuiteCard(suite: suite),
            ),
          ),
        );

        expect(find.text('só mais 5 pelo app'), findsOneWidget);
      });
    });

    testWidgets(
        'does not display "only X available" when exibirQtdDisponiveis is false',
        (WidgetTester tester) async {
      final suite = Suite(
        nome: 'Suite Luxo',
        qtd: 5,
        exibirQtdDisponiveis: false,
        fotos: ['https://example.com/suite.jpg'],
        itens: [],
        categoriaItens: [],
        periodos: [],
      );

      mockNetworkImagesFor(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SuiteCard(suite: suite),
            ),
          ),
        );

        expect(find.text('só mais 5 pelo app'), findsNothing);
      });
    });
  });
}
