import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/moteis/domain/entity/motel.dart';
import 'package:gdm_assignment/moteis/domain/entity/suite.dart';
import 'package:gdm_assignment/moteis/presentation/state/home_provider.dart';
import 'package:gdm_assignment/moteis/presentation/widget/motel_card.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:provider/provider.dart';

import '../../mocks.mocks.dart';

void main() {
  late MockHomeProvider mockHomeProvider;

  setUp(() {
    mockHomeProvider = MockHomeProvider();

    when(mockHomeProvider.filteredSuites).thenReturn([
      Suite(
        nome: 'Suite 1',
        qtd: 2,
        exibirQtdDisponiveis: true,
        fotos: ['photo1.png'],
        itens: [SuiteItem(nome: 'Item 1')],
        categoriaItens: [CategoriaItem(nome: 'Category 1', icone: 'icon1')],
        periodos: [
          Periodo(
            tempoFormatado: '2h',
            tempo: '120min',
            valor: 100.0,
            valorTotal: 120.0,
            temCortesia: true,
            desconto: 10.0,
          )
        ],
      ),
    ]);
    when(mockHomeProvider.isFavorite).thenReturn(false);
  });

  testWidgets('MotelCard widget test', (WidgetTester tester) async {
    mockNetworkImagesFor(
      () async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: ChangeNotifierProvider<HomeProvider>(
                create: (_) => mockHomeProvider,
                child: MotelCard(
                  motel: Motel(
                    fantasia: 'Motel 1',
                    logo: 'https://via.placeholder.com/150',
                    bairro: 'Bairro 1',
                    distancia: 10,
                    qtdFavoritos: 5,
                    suites: [
                      Suite(
                        nome: 'Suite 1',
                        qtd: 2,
                        exibirQtdDisponiveis: true,
                        fotos: ['photo1.png'],
                        itens: [SuiteItem(nome: 'Item 1')],
                        categoriaItens: [
                          CategoriaItem(nome: 'Category 1', icone: 'icon1')
                        ],
                        periodos: [
                          Periodo(
                            tempoFormatado: '2h',
                            tempo: '120min',
                            valor: 100.0,
                            valorTotal: 120.0,
                            temCortesia: true,
                            desconto: 10.0,
                          )
                        ],
                      ),
                    ],
                    qtdAvaliacoes: 10,
                    media: 4.5,
                  ),
                ),
              ),
            ),
          ),
        );

        await tester.pump();

        expect(find.text('Motel 1'), findsOneWidget);
        expect(find.text('10.0km - Bairro 1'), findsOneWidget);
        expect(find.text('10 avaliações'), findsOneWidget);
        expect(find.byType(IconButton), findsOneWidget);
        expect(find.byType(ExpandablePageView), findsOneWidget);

        expect(find.byType(CircleAvatar), findsOneWidget);

        final toggleFinder = find.byKey(const Key('toggle-favorite'));
        await tester.tap(toggleFinder);
        await tester.pumpAndSettle();
        verify(mockHomeProvider.isFavorite).called(1);
      },
    );
  });
}
