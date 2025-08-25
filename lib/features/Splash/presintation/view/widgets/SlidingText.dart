import 'package:bookly/features/Splash/presintation/view/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationcontroller,
      builder: (context, _) {
        return SlideTransition(
          position: slidinganimation,
          child: Text("Read books for free!", textAlign: TextAlign.center),
        );
      },
    );
  }
}
