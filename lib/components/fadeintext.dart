import 'package:flutter/material.dart';

class FadeInText extends StatefulWidget {
  final Duration delay;
  final Widget child;
  const FadeInText(
      {super.key,
      required this.delay,
      required this.child});

  @override
  State<FadeInText> createState() => _FadeInTextState();
}

class _FadeInTextState extends State<FadeInText> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );
  late final Animation<Offset> _animation2 = Tween<Offset>(
    begin: const Offset(0.0, 1.5),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeOutBack,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(widget.delay, () => 2),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        }
        _controller.forward();
        return SlideTransition(
            position: _animation2,
            child: FadeTransition(
              opacity: _animation,
              child: widget.child,
            ));
      },
    );
  }
}
