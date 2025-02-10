import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/core/exceptions/exceptions.dart';
import 'package:gdm_assignment/moteis/data/data_source/home_remote_data_source.dart';
import 'package:gdm_assignment/moteis/data/repository/home_repository_impl.dart';
import 'package:gdm_assignment/moteis/domain/entity/motel.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_repository_impl_test.mocks.dart';

@GenerateMocks([HomeRemoteDataSource])
void main() {
  late HomeRepositoryImpl repository;
  late MockHomeRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockHomeRemoteDataSource();
    repository = HomeRepositoryImpl(mockDataSource);
  });

  test('returns a list of moteis when the data source call is successful',
      () async {
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
    ];

    when(mockDataSource.getMoteis()).thenAnswer((_) async => moteisList);

    final result = await repository.getMoteis();

    expect(result, equals(moteisList));
    verify(mockDataSource.getMoteis()).called(1);
  });

  test('throws GetMoteisException when the data source throws it', () async {
    when(mockDataSource.getMoteis()).thenThrow(GetMoteisException());

    expect(() => repository.getMoteis(), throwsA(isA<GetMoteisException>()));
    verify(mockDataSource.getMoteis()).called(1);
  });
}
