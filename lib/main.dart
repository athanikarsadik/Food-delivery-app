import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_food_controller.dart';
import 'package:get/get.dart';

import 'helper/dependencies.dart' as dep;
import 'routes/route_helper.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RecommendedFoodController>(
      builder: (_) {
        return GetBuilder<CartController>(
          builder: (_) {
            return GetBuilder<PopularProductController>(
              builder: (_) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Food Delivery",
                  initialRoute: RouteHelper.getSplashPage(),
                  getPages: RouteHelper.routes

                );
              }
            );
          }
        );
      }
    );
  }
}
