import 'package:gdm_assignment/moteis/domain/entity/motel.dart';
import 'package:gdm_assignment/moteis/domain/repository/home_repository.dart';

class GetMoteisUseCase {
  final HomeRepository repository;

  GetMoteisUseCase(this.repository);

  Future<List<Motel>> call() => repository.getMoteis();
}
