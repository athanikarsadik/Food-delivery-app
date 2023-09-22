import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_food_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //icons
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20 * 3,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width20 * 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_checkout_rounded,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ]),
          ),
          //scroll list view
          Positioned(
              top: Dimensions.height20 * 5,
              bottom: 0,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            height: Dimensions.height20 * 5,
                            width: double.maxFinite,
                            child: Row(children: [
                              InkWell(
                                onTap: () {
                                  var popularIndex =
                                      Get.find<PopularProductController>()
                                          .popularProductList
                                          .indexOf(_cartList[index].product!);
                                  if (popularIndex >= 0) {
                                    Get.toNamed(RouteHelper.getPopularFood(
                                        popularIndex, "cartPage"));
                                  } else {
                                    var recIndex =
                                        Get.find<RecommendedFoodController>()
                                            .recommendedFoodList
                                            .indexOf(_cartList[index].product!);
                                    Get.toNamed(RouteHelper.getRecommendedFood(
                                        recIndex, "cartPage"));
                                  }
                                },
                                child: Container(
                                  width: Dimensions.height20 * 5,
                                  height: Dimensions.height20 * 5,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD_URL +
                                                  _cartList[index].img!)),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              Expanded(
                                  child: Container(
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(
                                      text: _cartList[index].name!,
                                      color: Colors.black,
                                    ),
                                    SmallText(text: "Spicy"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                          text: '\$ ${_cartList[index].price!}',
                                          color: Colors.black,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: Dimensions.height10,
                                              bottom: Dimensions.height10,
                                              left: Dimensions.width10,
                                              right: Dimensions.width10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                        _cartList[index]
                                                            .product!,
                                                        -1);
                                                  },
                                                  child: const Icon(
                                                      Icons.remove,
                                                      color:
                                                          AppColors.signColor)),
                                              SizedBox(
                                                width: Dimensions.width10 / 2,
                                              ),
                                              BigText(
                                                  text:
                                                      '${_cartList[index].quantity}'),
                                              SizedBox(
                                                width: Dimensions.width10 / 2,
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(
                                                        _cartList[index]
                                                            .product!,
                                                        1);
                                                  },
                                                  child: const Icon(Icons.add,
                                                      color:
                                                          AppColors.signColor)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),
                            ]),
                          );
                        });
                  }),
                ),
              )),
        ],
      ),
      bottomNavigationBar:
          GetBuilder<CartController>(builder: (cartController) {
        return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(text: '\$ ${cartController.totalAmount}'),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // popularProduct.addItem(product);
                    cartController.addtoHistory();
                  },
                  child: Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.height20,
                          bottom: Dimensions.height20,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                          color: AppColors.mainColor),
                      child: BigText(
                          text: "Check out",
                          color: Colors.white)),
                )
              ],
            ));
      }),
    );
  }
}
