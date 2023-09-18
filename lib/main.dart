import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_food_controller.dart';
import 'package:food_delivery/pages/home/main_food_page.dart';
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
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedFoodController>().getRecommendedFoodList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SDK Food",
      home:const MainFoodPage(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes

    );
  }
}
