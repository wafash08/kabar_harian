import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabar_harian/firebase_options.dart';
import 'package:kabar_harian/presentation/providers/router/router_provider.dart';
import 'package:kabar_harian/presentation/styles/styles.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(
    child: MainApp(),
  ));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}

/// Global helper for readability
AppStyle get $styles => AppStyle();
