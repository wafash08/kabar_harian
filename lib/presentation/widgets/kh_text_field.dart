import 'package:flutter/material.dart';
import 'package:kabar_harian/presentation/misc/methods.dart';

class KHTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  const KHTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        verticalSpace(8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.grey.shade200)),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.purple.shade200))),
        ),
      ],
    );
  }
}
