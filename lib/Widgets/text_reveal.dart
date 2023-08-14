import 'package:flutter/material.dart';

class TextReveal extends StatefulWidget {
  final Widget child;
  final double maxHeight;
  final AnimationController controller;
  final Animation<double>? textRevealAnimation;
  final Animation<double>? textOpacityAnimation;
  const TextReveal({super.key,
    required this.child,
    required this.maxHeight,
    required this.controller,
    required  this.textRevealAnimation,
    required this.textOpacityAnimation
  });

  @override
  State<TextReveal> createState() => _TextRevealState();
}

class _TextRevealState extends State<TextReveal> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> textRevealAnimation;
  late Animation<double> textOpacityAnimation;

  @override
  void initState() {
    // TODO: implement initState
    controller = widget.controller;

    textRevealAnimation = widget.textRevealAnimation ?? Tween<double>(begin: 100.0, end: 0.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.3, curve: Curves.easeOut)));

    textOpacityAnimation = widget.textOpacityAnimation ?? Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: controller,
            curve: Interval(0.0, 0.3, curve: Curves.easeOut)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,

      builder: (context,child) {
        return LimitedBox(
          child: Container(
            padding: EdgeInsets.only(top: textRevealAnimation.value),
            child: FadeTransition(
              opacity: textOpacityAnimation,
                child: widget.child),
          ),
        );
      }
    );
  }
}
