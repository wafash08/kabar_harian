import 'package:flutter/material.dart';
import 'package:kabar_harian/data/dummies/dummy_user_repository.dart';
import 'package:kabar_harian/data/firebase/firebase_authentication.dart';
import 'package:kabar_harian/data/firebase/firebase_user_repository.dart';
import 'package:kabar_harian/data/repositories/user_repository.dart';
import 'package:kabar_harian/domain/usecases/login.dart';
import 'package:kabar_harian/presentation/pages/main_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Login login = Login(
                  authentication: FirebaseAuthentication(),
                  userRepository: FirebaseUserRepository());

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
