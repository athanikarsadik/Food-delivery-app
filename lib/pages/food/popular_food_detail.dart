import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        //backgroung img
        Positioned(
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            height: Dimensions.popularFoodImgSize,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URL +
                        product.img!))),
          ),
        ),
        //icon widget
        Positioned(
          top: Dimensions.height45,
          left: Dimensions.width20,
          right: Dimensions.width20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                    // if (page == 'cartPage') {
                    //   Get.toNamed(RouteHelper.getCartPage());
                    // } else {
                    //   Get.toNamed(RouteHelper.initial);
                    // }
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios_new_rounded)),
              GetBuilder<PopularProductController>(builder: (popularProduct) {
                return GestureDetector(
                  onTap: () {
                    if (popularProduct.totalItems >= 1) {
                      Get.toNamed(RouteHelper.getCartPage());
                    }
                  },
                  child: Stack(
                    children: [
                      const AppIcon(icon: Icons.shopping_cart_checkout_rounded),
                      popularProduct.totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: AppIcon(
                                icon: Icons.circle,
                                size: Dimensions.height20,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.mainColor,
                              ),
                            )
                          : Container(),
                      popularProduct.totalItems >= 1
                          ? Positioned(
                              right: 5,
                              top: 3,
                              child: BigText(
                                text: popularProduct.totalItems.toString(),
                                size: 12,
                                color: Colors.white,
                              ))
                          : Container()
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        //introduction of food
        Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - Dimensions.height20,
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    top: Dimensions.height20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: product.name!),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Expanded(
                        child: SingleChildScrollView(
                            child: ExpandableTextWidget(
                                text: product.description!))),
                  ],
                ))),
        //expandable text widget
      ]),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
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
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(false);
                          },
                          child: const Icon(Icons.remove,
                              color: AppColors.signColor)),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(text: '${popularProduct.inCartItems}'),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      GestureDetector(
                          onTap: () {
                            popularProduct.setQuantity(true);
                          },
                          child: const Icon(Icons.add,
                              color: AppColors.signColor)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
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
                          text: "\$${product.price!} | Add to cart",
                          color: Colors.white)),
                )
              ],
            ));
      }),
    );
  }
}
