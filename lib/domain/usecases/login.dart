import 'package:kabar_harian/data/repositories/authentication.dart';
import 'package:kabar_harian/data/repositories/user_repository.dart';
import 'package:kabar_harian/domain/entities/result.dart';
import 'package:kabar_harian/domain/entities/user.dart';
import 'package:kabar_harian/domain/usecases/usecase.dart';

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}

class Login implements UseCase<Result<User>, LoginParams> {
  final Authentication authentication;
  final UserRepository userRepository;

  Login({required this.authentication, required this.userRepository});

  @override
  Future<Result<User>> call(LoginParams params) async {
    var id = await authentication.login(
        email: params.email, password: params.password);

    if (id is Success) {
      var userResult = await userRepository.getUser(uid: id.resultValue!);

      return switch (userResult) {
        Success(value: final user) => Result.success(user),
        Failed(:final message) => Result.failed(message)
      };
    } else {
      return Result.failed(id.errorMessage ?? 'Failed to login');
    }
  }
}
