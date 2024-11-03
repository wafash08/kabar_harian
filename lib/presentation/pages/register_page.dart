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

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

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

            // register form
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _RegisterForm(),
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
                              const Text('Already have an account?'),
                              horizontalSpace(4.0),
                              GestureDetector(
                                onTap: () {
                                  ref
                                      .read(routerProvider)
                                      .goNamed(ScreenPaths.namedLogin);
                                },
                                child: Text(
                                  'Sign in',
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

class _RegisterForm extends ConsumerWidget {
  final TextEditingController _nameController = TextEditingController();
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
              'Create your KabarHarian account',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -1.0),
            ),
            verticalSpace(20),
            KHTextField(
              controller: _nameController,
              label: 'Name',
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
                  semanticLabel: 'Create account',
                  padding: EdgeInsets.all($styles.insets.md),
                  expand: true,
                  onPressed: () {
                    ref.read(userDataProvider.notifier).register(
                          name: _nameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          imageUrl: null,
                        );
                  },
                  child: const Text(
                    'Create account',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
