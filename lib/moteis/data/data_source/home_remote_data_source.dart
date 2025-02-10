import 'package:dio/dio.dart';
import 'package:gdm_assignment/core/exceptions/exceptions.dart';
import 'package:gdm_assignment/moteis/data/data_source/api_url.dart';
import 'package:gdm_assignment/moteis/data/model/motel_model.dart';
import 'package:gdm_assignment/moteis/domain/entity/motel.dart';

abstract class HomeRemoteDataSource {
  Future<List<Motel>> getMoteis();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio client;

  HomeRemoteDataSourceImpl(this.client);

  @override
  Future<List<Motel>> getMoteis() async {
    try {
      final response = await client.get(Url.motel);

      if (response.statusCode == 200 && response.data["sucesso"] == true) {
        return List<MotelModel>.from(
          response.data["data"]["moteis"]
              .map((item) => MotelModel.fromJson(item)),
        );
      } else {
        throw GetMoteisException();
      }
    } on Exception catch (_) {
      throw GetMoteisException();
    }
  }
}
