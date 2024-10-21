import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabar_harian/presentation/providers/router/router_provider.dart';
import 'package:kabar_harian/presentation/providers/user_data/user_data_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (next is AsyncData) {
          if (next.value != null) {
            ref.read(routerProvider).goNamed('main');
          }
        } else if (next is AsyncError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(next.error.toString())));
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              ref
                  .read(userDataProvider.notifier)
                  .login(email: 'wafa@gmail.com', password: '123456');
            },
            child: const Text('Login')),
      ),
    );
  }
}
