import 'package:flutter/material.dart';
import 'package:kabar_harian/domain/entities/user.dart';

class MainPage extends StatelessWidget {
  final User user;
  const MainPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: Center(
        child: Text(user.toString()),
      ),
    );
  }
}
