import 'package:kabar_harian/data/repositories/authentication.dart';
import 'package:kabar_harian/domain/entities/result.dart';
import 'package:kabar_harian/domain/usecases/usecase.dart';

class Logout implements UseCase<Result<void>, void> {
  final Authentication _authentication;

  Logout({required Authentication authentication})
      : _authentication = authentication;

  @override
  Future<Result<void>> call(void _) {
    return _authentication.logout();
  }
}
