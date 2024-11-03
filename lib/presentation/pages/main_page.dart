import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabar_harian/domain/constants.dart';
import 'package:kabar_harian/presentation/misc/methods.dart';
import 'package:kabar_harian/presentation/providers/router/router_provider.dart';
import 'package:kabar_harian/presentation/providers/user_data/user_data_provider.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (previous != null && next is AsyncData && next.value == null) {
          ref.read(routerProvider).goNamed(ScreenPaths.namedLogin);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(ref.watch(userDataProvider).when(
                  data: (data) => data.toString(),
                  error: (error, stackTrace) => '',
                  loading: () => 'Loading...',
                )),
            verticalSpace(32.0),
            ElevatedButton(
                onPressed: () {
                  ref.read(userDataProvider.notifier).logout();
                },
                child: const Text('Logout'))
          ],
        ),
      ),
    );
  }
}
