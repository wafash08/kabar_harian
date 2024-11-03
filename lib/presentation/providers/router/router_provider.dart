import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:kabar_harian/domain/constants.dart';
import 'package:kabar_harian/presentation/pages/login_page.dart';
import 'package:kabar_harian/presentation/pages/main_page.dart';
import 'package:kabar_harian/presentation/pages/register_page.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef router) => GoRouter(routes: [
      GoRoute(
        path: ScreenPaths.main,
        name: ScreenPaths.namedMain,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: ScreenPaths.login,
        name: ScreenPaths.namedLogin,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: ScreenPaths.register,
        name: ScreenPaths.namedRegister,
        builder: (context, state) => const RegisterPage(),
      ),
    ], initialLocation: ScreenPaths.login, debugLogDiagnostics: true);
