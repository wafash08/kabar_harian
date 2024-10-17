import 'package:kabar_harian/domain/usecases/login.dart';
import 'package:kabar_harian/presentation/providers/repositories/authentication_provider.dart';
import 'package:kabar_harian/presentation/providers/repositories/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) => Login(
    authentication: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider));
