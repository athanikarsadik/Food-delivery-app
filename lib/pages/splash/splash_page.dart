import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_food_controller.dart';
import '../auth/sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation1;
  late Animation<double> animation2;
  late AnimationController controller;
  late AnimationController controller1;

  Future<void> _loadResourses() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedFoodController>().getRecommendedFoodList();
  }

  @override
  void initState() {
    super.initState();
    _loadResourses();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();
    animation1 = CurvedAnimation(parent: controller, curve: Curves.linear);
    controller1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();
    animation2 = CurvedAnimation(parent: controller1, curve: Curves.fastEaseInToSlowEaseOut);
    Timer(const Duration(milliseconds: 3100), () {
      // Get.offNamed(RouteHelper.getInitial());
      Get.off(const SignInPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                  scale: animation1,
                  child: Image.asset(
                    "assets/image/logo part 1.png",
                    width: Dimensions.listViewImg*2,
                  )),
              ScaleTransition(
                scale: animation2,
                child: Image.asset(
                  "assets/image/logo part 2.png",
                  width: Dimensions.listViewImg*2,
                ),
              ),
            ],
          ),
        ));
  }
}
