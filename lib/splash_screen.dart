import 'dart:ui';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  late Animation opacityAnimation;
  late Animation blurAnimation;

  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 10));
    animation = Tween(begin: 1.0, end: 3.0).animate(CurvedAnimation(parent: animationController, curve: Curves.easeIn,reverseCurve: Curves.easeOut));
    opacityAnimation = Tween<double>(begin: 1, end: 0.5).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn,reverseCurve: Curves.bounceOut));
    blurAnimation = Tween<double>(begin: 0, end: 5).animate(
        animationController);
    Future.delayed(const Duration(seconds: 2), () {
      animationController.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          /*child: const Text(
            'Splash',
            style: TextStyle(
                fontSize: 50,
                color: Colors.orange,
                fontWeight: FontWeight.bold),
          ),*/
          builder: (context, child) {
            return Stack(
              children: [
                Transform.scale(
                  scale: animation.value,
                  child: Opacity(
                    opacity: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: double.maxFinite,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/splash.jpg'),
                            fit: BoxFit.fill),
                      ),
                      // child: Center(
                      //   child: ImageFiltered( imageFilter: ImageFilter.blur(sigmaX: blurAnimation.value, sigmaY: blurAnimation.value),child: child),
                      // ),
                    ),
                  ),
                ),
               /* Align(
                  alignment: Alignment.center,
                  child: child,
                )*/
                Align(
                  alignment: Alignment.center,
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: blurAnimation.value, sigmaY: blurAnimation.value),
                    child: const Text(
                      'Splash',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            );
          },
          animation: animation,
        ),
      ),
    );
  }
}
