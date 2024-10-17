import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabar_harian/domain/usecases/login.dart';
import 'package:kabar_harian/presentation/pages/main_page.dart';
import 'package:kabar_harian/presentation/providers/usecases/login_provider.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Login login = ref.watch(loginProvider);

              login(LoginParams(email: 'wafa@gmail.com', password: '123456'))
                  .then(
                (value) {
                  if (value.isSuccess) {
                    if (context.mounted) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return MainPage(user: value.resultValue!);
                        },
                      ));
                    }
                  } else {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(value.errorMessage!)));
                    }
                  }
                },
              );
            },
            child: const Text('Login')),
      ),
    );
  }
}
