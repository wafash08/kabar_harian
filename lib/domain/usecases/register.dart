import 'package:kabar_harian/data/repositories/authentication.dart';
import 'package:kabar_harian/data/repositories/user_repository.dart';
import 'package:kabar_harian/domain/entities/result.dart';
import 'package:kabar_harian/domain/entities/user.dart';
import 'package:kabar_harian/domain/usecases/usecase.dart';

class Register implements UseCase<Result<User>, RegisterParams> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  Register(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(RegisterParams params) async {
    var uidResult = await _authentication.register(
        email: params.email, password: params.password);

    if (uidResult.isSuccess) {
      var userResult = await _userRepository.createUser(
          uid: uidResult.resultValue!,
          email: params.email,
          name: params.name,
          photoUrl: params.photoUrl);

      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage ?? 'Failed to register');
      }
    } else {
      return Result.failed(uidResult.errorMessage ?? 'Failed to register');
    }
  }
}

class RegisterParams {
  final String name;
  final String email;
  final String password;
  String? photoUrl;

  RegisterParams(
      {required this.name,
      required this.email,
      required this.password,
      this.photoUrl});
}
