import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:kabar_harian/domain/entities/result.dart';
import 'package:kabar_harian/domain/entities/user.dart';
import 'package:kabar_harian/domain/usecases/get_logged_in_user.dart';
import 'package:kabar_harian/domain/usecases/login.dart';
import 'package:kabar_harian/domain/usecases/logout.dart';
import 'package:kabar_harian/domain/usecases/register.dart';
import 'package:kabar_harian/domain/usecases/upload_profile_picture.dart';
import 'package:kabar_harian/presentation/providers/usecases/get_logged_in_user_provider.dart';
import 'package:kabar_harian/presentation/providers/usecases/login_provider.dart';
import 'package:kabar_harian/presentation/providers/usecases/logout_provider.dart';
import 'package:kabar_harian/presentation/providers/usecases/register_provider.dart';
import 'package:kabar_harian/presentation/providers/usecases/upload_profile_picture_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<User?> build() async {
    // method build ini digunakan untuk memberikan nilai awal state
    GetLoggedInUser getLoggedInUser = ref.read(getLoggedInUserProvider);
    var userResult = await getLoggedInUser(null);

    switch (userResult) {
      case Success(value: final user):
        return user;
      case Failed(message: _):
        return null;
    }
  }

  Future<void> login({required String email, required String password}) async {
    state = const AsyncLoading();

    Login login = ref.read(loginProvider);
    var result = await login(LoginParams(email: email, password: password));

    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> register(
      {required String email,
      required String password,
      required String name,
      String? imageUrl}) async {
    state = const AsyncLoading();

    Register register = ref.read(registerProvider);
    var result = await register(
        RegisterParams(name: name, email: email, password: password));

    switch (result) {
      case Success(value: final user):
        state = AsyncData(user);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> logout() async {
    Logout logout = ref.read(logoutProvider);
    var result = await logout(null);

    switch (result) {
      case Success(value: _):
        state = const AsyncData(null);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull);
    }
  }

  Future<void> uploadProfilePicture(
      {required User user, required File imageFile}) async {
    UploadProfilePicture uploadProfilePicture =
        ref.read(uploadProfilePictureProvider);
    var result = await uploadProfilePicture(
        UploadProfilePictureParams(user: user, imageFile: imageFile));

    if (result case Success(value: final user)) {
      state = AsyncData(user);
    }
  }
}
