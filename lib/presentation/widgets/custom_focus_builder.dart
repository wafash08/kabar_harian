import 'package:flutter/material.dart';

class CustomFocusBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, FocusNode focus) builder;
  final void Function(bool hasFocus)? onFocusChanged;
  final FocusNode? focusNode;

  const CustomFocusBuilder(
      {super.key, required this.builder, this.onFocusChanged, this.focusNode});

  @override
  State<CustomFocusBuilder> createState() => _CustomFocusBuilderState();
}

class _CustomFocusBuilderState extends State<CustomFocusBuilder> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_handleFocusChanged);
    super.initState();
  }

  void _handleFocusChanged() {
    widget.onFocusChanged?.call(_focusNode.hasFocus);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder.call(context, _focusNode);
  }
}
