import 'dart:io';

import 'package:kabar_harian/domain/entities/result.dart';
import 'package:kabar_harian/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
  });

  Future<Result<User>> getUser({required String uid});
  Future<Result<User>> updateUser({required User user});
  Future<Result<User>> uploadProfilePicture(
      {required User user, required File image});
}
