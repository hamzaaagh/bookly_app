import 'package:bookly/core/utils/AssetData.dart';
import 'package:bookly/features/Splash/presintation/view/widgets/SlidingText.dart';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

late AnimationController animationcontroller;
late Animation<Offset> slidinganimation;

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    animate();
    niavigatorToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(Assetdata.logo),
        SizedBox(height: 2),
        SlidingText(),
      ],
    );
  }

  void animate() {
    animationcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    slidinganimation = Tween<Offset>(
      begin: Offset(0, 6),
      end: Offset.zero,
    ).animate(animationcontroller);
    animationcontroller.forward();
  }

  void niavigatorToHome() {
    Future.delayed(Duration(seconds: 2), () {
      // Get.to(
      //   const HomeView(),
      //   transition: Transition.fade,
      //   duration: ktransitionduration,
      // );
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push("/homeview");
    });
  }
}
