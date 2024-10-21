import 'dart:io';

import 'package:kabar_harian/data/repositories/user_repository.dart';
import 'package:kabar_harian/domain/entities/result.dart';
import 'package:kabar_harian/domain/entities/user.dart';
import 'package:kabar_harian/domain/usecases/usecase.dart';

class UploadProfilePicture
    implements UseCase<Result<User>, UploadProfilePictureParams> {
  final UserRepository _userRepository;

  UploadProfilePicture({required UserRepository userRepository})
      : _userRepository = userRepository;
  @override
  Future<Result<User>> call(UploadProfilePictureParams params) =>
      _userRepository.uploadProfilePicture(
          user: params.user, image: params.imageFile);
}

class UploadProfilePictureParams {
  final User user;
  final File imageFile;

  UploadProfilePictureParams({required this.user, required this.imageFile});
}
