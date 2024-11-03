import 'package:flutter/material.dart';
import 'package:kabar_harian/main.dart';
import 'package:kabar_harian/presentation/misc/methods.dart';

class KHTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;

  const KHTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.keyboardType = TextInputType.text,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    TextStyle style = const TextStyle(fontSize: 14);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        verticalSpace(8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: style,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: Colors.grey.shade200)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: $styles.colors.blueMagenta.withOpacity(0.5)))),
        ),
      ],
    );
  }
}
