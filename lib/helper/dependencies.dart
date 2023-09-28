import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_food_controller.dart';
import 'package:food_delivery/data/api/api_client.dart';
import 'package:food_delivery/data/repository/auth_repo.dart';
import 'package:food_delivery/data/repository/cart_repo.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/data/repository/recommended_food_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_constants.dart';

Future<void> init() async{

  final sharedPreferences =await SharedPreferences.getInstance();

  Get.lazyPut(()=> sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  //Repos
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(),sharedPreferences: Get.find()));
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedFoodRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => RecommendedFoodController(recommendedFoodRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
  // Get.put(CartController(cartRepo: Get.find()));
}