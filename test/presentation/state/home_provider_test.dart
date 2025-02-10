import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/moteis/domain/entity/motel.dart';
import 'package:gdm_assignment/moteis/domain/entity/suite.dart';
import 'package:gdm_assignment/moteis/domain/use_case/get_moteis_use_case.dart';
import 'package:gdm_assignment/moteis/presentation/state/home_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_provider_test.mocks.dart';

@GenerateMocks([GetMoteisUseCase])
void main() {
  late HomeProvider provider;
  late MockGetMoteisUseCase mockGetMoteisUseCase;

  final sampleSuites = [
    Suite(
        nome: "Suite A",
        qtd: 1,
        exibirQtdDisponiveis: true,
        fotos: [],
        itens: [],
        categoriaItens: [],
        periodos: [])
  ];

  final sampleMotelList = [
    Motel(
      fantasia: "Motel A",
      logo: "https://picsum.photos/200",
      bairro: "Bairro A",
      distancia: 2.5,
      qtdFavoritos: 10,
      suites: sampleSuites,
      qtdAvaliacoes: 20,
      media: 4.5,
    ),
  ];

  final empty = <Motel>[];

  setUp(() {
    mockGetMoteisUseCase = MockGetMoteisUseCase();
    provider = HomeProvider(mockGetMoteisUseCase);
  });

  group('getMotelList', () {
    test('fetches and sets motel list, and initializes filteredSuites',
        () async {
      when(mockGetMoteisUseCase.call())
          .thenAnswer((_) async => sampleMotelList);

      await provider.getMotelList();

      expect(provider.motelList, equals(sampleMotelList));
      expect(provider.filteredSuites, equals(sampleSuites));
      verify(mockGetMoteisUseCase.call()).called(1);
    });

    test('notifies listeners after fetching motel list', () async {
      bool listenerCalled = false;
      provider.addListener(() {
        listenerCalled = true;
      });

      when(mockGetMoteisUseCase.call())
          .thenAnswer((_) async => sampleMotelList);

      await provider.getMotelList();

      expect(listenerCalled, isTrue);
    });
  });

  group('toggleFavorite', () {
    test('toggles isFavorite and notifies listeners', () {
      bool listenerCalled = false;
      provider.addListener(() {
        listenerCalled = true;
      });

      provider.toggleFavorite();

      expect(provider.isFavorite, isTrue);
      expect(listenerCalled, isTrue);

      listenerCalled = false;
      provider.toggleFavorite();

      expect(provider.isFavorite, isFalse);
      expect(listenerCalled, isTrue);
    });
  });
}
