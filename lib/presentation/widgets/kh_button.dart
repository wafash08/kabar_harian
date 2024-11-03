import 'package:flutter/material.dart';
import 'package:kabar_harian/main.dart';
import 'package:kabar_harian/presentation/widgets/custom_focus_builder.dart';

class KHButton extends StatelessWidget {
  // interaction
  final VoidCallback? onPressed;
  final String semanticLabel;

  // content
  final Widget child;

  // layout
  final EdgeInsets? padding;
  final bool expand;

  // style
  final bool pressEffect;

  const KHButton(
      {super.key,
      this.onPressed,
      required this.child,
      required this.semanticLabel,
      this.padding,
      this.expand = false,
      this.pressEffect = true});

  @override
  Widget build(BuildContext context) {
    Color defaultColor = $styles.colors.blueMagenta;
    OutlinedBorder shape = RoundedRectangleBorder(
        side: BorderSide(color: defaultColor),
        borderRadius: BorderRadius.circular($styles.corners.base));

    ButtonStyle style = TextButton.styleFrom(
        backgroundColor: defaultColor,
        shape: shape,
        padding: padding ??
            EdgeInsets.symmetric(
                horizontal: $styles.insets.sm, vertical: $styles.insets.xs));

    Widget button = CustomFocusBuilder(
      builder: (context, focus) {
        return Stack(
          children: [
            Opacity(
              opacity: 1,
              child: TextButton(
                onPressed: onPressed,
                style: style,
                focusNode: focus,
                child: expand
                    ? Center(
                        child: child,
                      )
                    : child,
              ),
            ),
            if (focus.hasFocus)
              Positioned.fill(
                  child: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular($styles.corners.base),
                      border: Border.all(
                          color: $styles.colors.blueMagenta.withOpacity(0.75),
                          width: 3)),
                ),
              ))
          ],
        );
      },
    );

    // add press effect
    if (pressEffect && onPressed != null) {
      button = ButtonPressEffect(child: button);
    }

    return Semantics(
      label: semanticLabel,
      button: true,
      container: true,
      child: ExcludeSemantics(
        child: button,
      ),
    );
  }
}

class ButtonPressEffect extends StatefulWidget {
  final Widget child;

  const ButtonPressEffect({super.key, required this.child});

  @override
  State<ButtonPressEffect> createState() => _ButtonPressEffectState();
}

class _ButtonPressEffectState extends State<ButtonPressEffect> {
  bool _isDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      excludeFromSemantics: true,
      onTapDown: (_) => setState(() => _isDown = true),
      onTapUp: (_) => setState(() => _isDown = false),
      onTapCancel: () => setState(() => _isDown = false),
      behavior: HitTestBehavior.translucent,
      child: Opacity(
        opacity: _isDown ? 0.75 : 1,
        child: ExcludeSemantics(
          child: widget.child,
        ),
      ),
    );
  }
}
