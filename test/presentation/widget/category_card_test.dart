import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/moteis/domain/entity/suite.dart';
import 'package:gdm_assignment/moteis/presentation/widget/category_card.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  group('CategoryCard Widget Tests', () {
    late Suite suite;

    setUp(() {
      suite = Suite(
        nome: "Suite A",
        qtd: 2,
        exibirQtdDisponiveis: true,
        fotos: [],
        itens: [SuiteItem(nome: "Item 1"), SuiteItem(nome: "Item 2")],
        categoriaItens: [
          CategoriaItem(nome: "Categoria 1", icone: "https://picsum.photos/48"),
          CategoriaItem(nome: "Categoria 2", icone: "https://picsum.photos/48"),
        ],
        periodos: [],
      );
    });

    testWidgets('renders icons and category text correctly',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: CategoryCard(suite: suite),
          ),
        ));

        expect(find.byType(Image), findsNWidgets(2));

        expect(find.text("ver\ntodos"), findsOneWidget);
      });
    });

    testWidgets('shows modal bottom sheet when "ver todos" is tapped',
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() async {
        await tester.pumpWidget(MaterialApp(
          home: Scaffold(
            body: CategoryCard(suite: suite),
          ),
        ));

        await tester.tap(find.text("ver\ntodos"));
        await tester.pumpAndSettle();

        expect(find.text("Suite A"), findsOneWidget);
        expect(find.text("Item 1, Item 2"), findsOneWidget);
      });
    });
  });
}
