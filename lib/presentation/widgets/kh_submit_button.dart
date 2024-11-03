import 'package:flutter/material.dart';

class KHSubmitButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const KHSubmitButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20.0),
            backgroundColor: Colors.purple,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)))),
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ));
  }
}
