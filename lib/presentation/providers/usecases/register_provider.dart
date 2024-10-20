import 'package:kabar_harian/domain/usecases/register.dart';
import 'package:kabar_harian/presentation/providers/repositories/authentication_provider.dart';
import 'package:kabar_harian/presentation/providers/repositories/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_provider.g.dart';

@riverpod
Register register(RegisterRef ref) => Register(
    authentication: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider));
