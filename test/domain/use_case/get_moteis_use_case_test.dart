import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/moteis/domain/entity/motel.dart';
import 'package:gdm_assignment/moteis/domain/repository/home_repository.dart';
import 'package:gdm_assignment/moteis/domain/use_case/get_moteis_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_moteis_use_case_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late GetMoteisUseCase useCase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    useCase = GetMoteisUseCase(mockRepository);
  });

  final moteisList = [
    Motel(
      fantasia: "Motel A",
      logo: "https://picsum.photos/200",
      bairro: "Bairro A",
      distancia: 2.5,
      qtdFavoritos: 10,
      suites: [],
      qtdAvaliacoes: 20,
      media: 4.5,
    ),
    Motel(
      fantasia: "Motel B",
      logo: "https://picsum.photos/200",
      bairro: "Bairro B",
      distancia: 3.0,
      qtdFavoritos: 15,
      suites: [],
      qtdAvaliacoes: 25,
      media: 4.8,
    ),
  ];

  group('GetMoteisUseCase', () {
    test('returns a list of moteis when the repository call is successful',
        () async {
      when(mockRepository.getMoteis()).thenAnswer((_) async => moteisList);

      final result = await useCase.call();

      expect(result, equals(moteisList));
      verify(mockRepository.getMoteis()).called(1);
    });

    test('throws an exception when the repository throws an exception',
        () async {
      when(mockRepository.getMoteis())
          .thenThrow(Exception("Failed to fetch data"));

      expect(() => useCase.call(), throwsA(isA<Exception>()));
      verify(mockRepository.getMoteis()).called(1);
    });
  });
}
