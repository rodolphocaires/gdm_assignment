import 'package:gdm_assignment/core/exceptions/exceptions.dart';
import 'package:gdm_assignment/moteis/data/data_source/home_remote_data_source.dart';
import 'package:gdm_assignment/moteis/domain/entity/motel.dart';
import 'package:gdm_assignment/moteis/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<List<Motel>> getMoteis() async {
    try {
      return await dataSource.getMoteis();
    } on GetMoteisException catch (_) {
      rethrow;
    }
  }
}
