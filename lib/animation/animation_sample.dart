import 'package:flutter/material.dart';
import 'package:sample/animation/fifth_page.dart';
import 'package:sample/animation/fourth_page.dart';
import 'package:sample/animation/second_page.dart';
import 'package:sample/animation/third_page.dart';

class AnimationSample extends StatefulWidget {
  const AnimationSample({Key? key}) : super(key: key);

  @override
  State<AnimationSample> createState() => _AnimationSampleState();
}

class _AnimationSampleState extends State<AnimationSample>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> secondAnimation;
  late Animation<double> thirdAnimation;
  late Animation<double> fourthAnimation;

  late AnimationController animationController;
  late AnimationController secondController;
  late AnimationController thirdController;
  late AnimationController fourthController;

  List<StatefulWidget> pages = [
    const SecondPage(),
    const ThirdPage(),
    const FourthPage(),
    const FifthPage()
  ];
  int currentPage = 0;
  PageController pageController = PageController();
  bool checkPage = false;

  int selectedIndex = 0;
  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation = Tween(begin: 2.0, end: 3.0).animate(
      animationController,
    );
    secondController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    secondAnimation = Tween(begin: 2.0, end: 3.0).animate(
      secondController,
    );
    thirdController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    thirdAnimation = Tween(begin: 2.0, end: 3.0).animate(thirdController);
    fourthController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    fourthAnimation = Tween(begin: 2.0, end: 3.0).animate(fourthController);
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        secondController.forward();
        pageController.jumpToPage(1);
      }
    });
    secondController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        thirdController.forward();
        pageController.jumpToPage(2);
      }
    });
    thirdController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        fourthController.forward();
        pageController.jumpToPage(3);
      }
    });
    fourthController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    secondController.dispose();
    thirdController.dispose();
    fourthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            GestureDetector(
              /*onTap: () {
                currentPage = currentPage + 1;
                pageController.jumpToPage(currentPage);
                if (currentPage == 4) {
                  Navigator.pop(context);
                }
              },*/
              onTapDown: (TapDownDetails details) {
                final dx = details.globalPosition.dx;
                final width = MediaQuery.of(context).size.width;
                if (dx < width / 2) {
                  selectedIndex = selectedIndex - 1;
                  if (selectedIndex == 2) {
                    fourthController.value = 0.0;
                    thirdController.value = 0.0;
                    thirdController.forward();
                  } else if (selectedIndex == 1) {
                    thirdController.value = 0.0;
                    secondController.value = 0.0;
                    secondController.forward();
                  } else if (selectedIndex == 0) {
                    secondController.value = 0.0;
                    animationController.value = 0.0;
                    animationController.forward();
                  } else if (selectedIndex == -1) {
                    Navigator.pop(context);
                  }
                  print('>>>>>>>>>>> previous page $selectedIndex');
                  pageController.jumpToPage(selectedIndex);
                } else {
                  /* print('>>>>>>>>>>>$currentPage');
                  currentPage = currentPage + 1;
                  pageController.jumpToPage(currentPage);
                  if (currentPage == 4) {
                    Navigator.pop(context);
                  }*/
                  print('>>>>>>>>>>>$selectedIndex');
                  selectedIndex = selectedIndex + 1;
                  pageController.jumpToPage(selectedIndex);
                  if (selectedIndex == 4) {
                    Navigator.pop(context);
                  }
                }
              },
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                itemCount: pages.length,
                itemBuilder: (context, position) {
                  return pages[position];
                },
                onPageChanged: (page) {
                  setState(() {
                    selectedIndex = page;
                  });
                  if (selectedIndex == 1) {
                    animationController.value = 1.0;
                    secondController.forward();
                  } else if (selectedIndex == 2) {
                    secondController.value = 1.0;
                    thirdController.forward();
                  } else if (selectedIndex == 3) {
                    thirdController.value = 1.0;
                    fourthController.forward();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        height: 5,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey),
                        child: AnimatedBuilder(
                          animation: animation,
                          builder: (context, child) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: LinearProgressIndicator(
                                value: animationController.value,
                                color: Colors.white,
                                backgroundColor: Colors.grey,
                              ),
                            );
                          },
                        )),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                        height: 5,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey),
                        child: AnimatedBuilder(
                          animation: secondAnimation,
                          builder: (context, child) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: LinearProgressIndicator(
                                value: secondController.value,
                                color: Colors.white,
                                backgroundColor: Colors.grey,
                              ),
                            );
                          },
                        )),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                        height: 5,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey),
                        child: AnimatedBuilder(
                          animation: thirdAnimation,
                          builder: (context, child) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: LinearProgressIndicator(
                                value: thirdController.value,
                                color: Colors.white,
                                backgroundColor: Colors.grey,
                              ),
                            );
                          },
                        )),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                        height: 5,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.grey),
                        child: AnimatedBuilder(
                          animation: fourthAnimation,
                          builder: (context, child) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: LinearProgressIndicator(
                                value: fourthController.value,
                                color: Colors.white,
                                backgroundColor: Colors.grey,
                              ),
                            );
                          },
                        )),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
