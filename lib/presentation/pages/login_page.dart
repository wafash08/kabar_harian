import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabar_harian/domain/constants.dart';
import 'package:kabar_harian/main.dart';
import 'package:kabar_harian/presentation/misc/methods.dart';
import 'package:kabar_harian/presentation/providers/router/router_provider.dart';
import 'package:kabar_harian/presentation/providers/user_data/user_data_provider.dart';
import 'package:kabar_harian/presentation/widgets/kh_button.dart';
import 'package:kabar_harian/presentation/widgets/kh_logo.dart';
import 'package:kabar_harian/presentation/widgets/kh_text_field.dart';

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

    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: $styles.insets.md),
          child: Stack(children: [
            // dua garis di bawah form
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

            // form login
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: $styles.insets.lg, left: $styles.insets.md),
                  child: const KHLogo(),
                ),
                verticalSpace(24),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
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
                        borderRadius: BorderRadius.all(
                            Radius.circular($styles.corners.md))),
                    child: Column(
                      children: [
                        _LoginForm(),
                        verticalSpace(32.0),
                        Container(
                          height: 56,
                          margin: EdgeInsets.all($styles.insets.xxs),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('New to KabarHarian?'),
                              horizontalSpace(4.0),
                              GestureDetector(
                                onTap: () {
                                  ref
                                      .read(routerProvider)
                                      .goNamed(ScreenPaths.namedRegister);
                                },
                                child: Text(
                                  'Create account',
                                  style: TextStyle(
                                      color: Colors.blueAccent.shade700),
                                ),
                              )
                            ],
                          ),
                        )
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

class _LoginForm extends ConsumerWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: $styles.insets.md, vertical: $styles.insets.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign in to your account',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1.0),
            ),
            verticalSpace(20),
            KHTextField(
              controller: _emailController,
              label: 'Email',
            ),
            verticalSpace(20),
            KHTextField(
              controller: _passwordController,
              label: 'Password',
              obscureText: true,
            ),
            verticalSpace(32.0),
            SizedBox(
              width: double.infinity,
              child: KHButton(
                  semanticLabel: 'Sign in',
                  padding: EdgeInsets.all($styles.insets.md),
                  expand: true,
                  onPressed: () {
                    ref.read(userDataProvider.notifier).login(
                        email: _emailController.text,
                        password: _passwordController.text);
                  },
                  child: const Text(
                    'Sign in',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
