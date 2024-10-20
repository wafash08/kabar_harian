import 'package:kabar_harian/domain/usecases/get_logged_in_user.dart';
import 'package:kabar_harian/presentation/providers/repositories/authentication_provider.dart';
import 'package:kabar_harian/presentation/providers/repositories/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_logged_in_user_provider.g.dart';

@riverpod
GetLoggedInUser getLoggedInUser(GetLoggedInUserRef ref) => GetLoggedInUser(
    authentication: ref.watch(authenticationProvider),
    userRepository: ref.watch(userRepositoryProvider));
