import 'package:flutter/widgets.dart';

class AnimatedVisibility extends StatelessWidget {
  const AnimatedVisibility({
    required this.child,
    required this.visible,
    this.duration = const Duration(milliseconds: 300),
    this.height,
    this.width,
    super.key,
  });

  final Duration duration;
  final Widget child;
  final bool visible;

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: duration,
      child: SizedBox(
        height: visible ? height : 0,
        width: visible ? width : 0,
        child: Visibility(
          visible: visible,
          child: child,
        ),
      ),
    );
  }
}
