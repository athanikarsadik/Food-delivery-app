import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/food/recommended_food_detail.dart';
import 'package:food_delivery/pages/home/home_page.dart';
import 'package:get/get.dart';

import '../pages/cart/cart_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getInitial() => initial;
  static String getPopularFood(int pageId,String page) => '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId,String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => cartPage;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomePage()),

    GetPage(
        name: popularFood,
        transition: Transition.leftToRightWithFade,
        transitionDuration: const Duration(milliseconds: 300),
        page: () {
          var page = Get.parameters['page'];
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!),page: page!);
        }),
    GetPage(
        name: recommendedFood,
        transition: Transition.downToUp,
        transitionDuration: const Duration(milliseconds: 300),
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!),page: page!);
        }),
    GetPage(
        name: cartPage,
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 300),
        page: () {
          return const CartPage();
        }),
  ];
}
