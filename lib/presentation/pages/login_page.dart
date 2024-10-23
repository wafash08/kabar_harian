import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabar_harian/presentation/misc/methods.dart';
import 'package:kabar_harian/presentation/providers/router/router_provider.dart';
import 'package:kabar_harian/presentation/providers/user_data/user_data_provider.dart';
import 'package:kabar_harian/presentation/widgets/kh_logo.dart';
import 'package:kabar_harian/presentation/widgets/kh_text_field.dart';

class LoginPage extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

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

    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Stack(children: [
            Container(
              height: size.height,
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                          style: BorderStyle.solid),
                      right: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                          style: BorderStyle.solid))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 28, left: 20),
                  child: KHLogo(),
                ),
                verticalSpace(24),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 32.0),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            blurRadius: 12,
                            spreadRadius: 0,
                            offset: Offset(
                              0,
                              4,
                            ),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(12.0))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Sign in to your account',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -1.0),
                        ),
                        verticalSpace(12.0),
                        KHTextField(
                          controller: _emailController,
                          label: 'Email',
                        ),
                        verticalSpace(32.0),
                        KHTextField(
                          controller: _passwordController,
                          label: 'Password',
                          obscureText: true,
                        ),
                        verticalSpace(32.0),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(16),
                                backgroundColor: Colors.purple,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)))),
                            onPressed: () {
                              ref.read(userDataProvider.notifier).login(
                                  email: 'wafa@gmail.com', password: '123456');
                            },
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            )),
                      ],
                    )),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
