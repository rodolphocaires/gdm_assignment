import 'package:gdm_assignment/moteis/domain/entity/motel.dart';

abstract class HomeRepository {
  Future<List<Motel>> getMoteis();
}
