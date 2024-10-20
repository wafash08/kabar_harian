import 'package:kabar_harian/domain/usecases/logout.dart';
import 'package:kabar_harian/presentation/providers/repositories/authentication_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_provider.g.dart';

@riverpod
Logout logout(LogoutRef ref) =>
    Logout(authentication: ref.watch(authenticationProvider));
