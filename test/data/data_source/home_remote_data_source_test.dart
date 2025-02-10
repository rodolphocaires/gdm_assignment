import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gdm_assignment/core/exceptions/exceptions.dart';
import 'package:gdm_assignment/moteis/data/data_source/api_url.dart';
import 'package:gdm_assignment/moteis/data/data_source/home_remote_data_source.dart';
import 'package:gdm_assignment/moteis/data/model/motel_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'home_remote_data_source_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late HomeRemoteDataSourceImpl dataSource;

  setUp(() {
    mockDio = MockDio();
    dataSource = HomeRemoteDataSourceImpl(mockDio);
  });

  group('HomeRemoteDataSourceImpl', () {
    test('returns a list of moteis when the response is successful', () async {
      // Arrange
      final responseData = {
        "sucesso": true,
        "data": {
          "moteis": [
            {"fantasia": "Motel A"},
            {"fantasia": "Motel B"},
          ]
        }
      };
      when(mockDio.get(Url.motel)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: Url.motel),
          statusCode: 200,
          data: responseData,
        ),
      );

      // Act
      final result = await dataSource.getMoteis();

      // Assert
      expect(result, isA<List<MotelModel>>());
      expect(result.length, 2);
      expect(result[0].fantasia, "Motel A");
    });

    test('throws GetMoteisException when the response is unsuccessful',
        () async {
      // Arrange
      final responseData = {"sucesso": false};
      when(mockDio.get(Url.motel)).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: Url.motel),
          statusCode: 400,
          data: responseData,
        ),
      );

      // Act & Assert
      expect(() => dataSource.getMoteis(), throwsA(isA<GetMoteisException>()));
    });

    test('throws GetMoteisException when Dio throws an exception', () async {
      // Arrange
      when(mockDio.get(Url.motel)).thenThrow(DioException(
        requestOptions: RequestOptions(path: Url.motel),
      ));

      // Act & Assert
      expect(() => dataSource.getMoteis(), throwsA(isA<GetMoteisException>()));
    });
  });
}
