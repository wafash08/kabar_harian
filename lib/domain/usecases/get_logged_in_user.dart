import 'package:kabar_harian/data/repositories/authentication.dart';
import 'package:kabar_harian/data/repositories/user_repository.dart';
import 'package:kabar_harian/domain/entities/result.dart';
import 'package:kabar_harian/domain/entities/user.dart';
import 'package:kabar_harian/domain/usecases/usecase.dart';

class GetLoggedInUser implements UseCase<Result<User>, void> {
  final Authentication _authentication;
  final UserRepository _userRepository;

  GetLoggedInUser(
      {required Authentication authentication,
      required UserRepository userRepository})
      : _authentication = authentication,
        _userRepository = userRepository;

  @override
  Future<Result<User>> call(void _) async {
    var loggedInUserId = _authentication.getLoggedInUserId();

    if (loggedInUserId != null) {
      var userResult = await _userRepository.getUser(uid: loggedInUserId);

      if (userResult.isSuccess) {
        return Result.success(userResult.resultValue!);
      } else {
        return Result.failed(userResult.errorMessage!);
      }
    } else {
      return const Result.failed('No user logged in');
    }
  }
}
