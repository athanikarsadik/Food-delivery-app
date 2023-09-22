import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/utils/app_constants.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../models/cart_model.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CartModel> getCartHistoryList =
        Get.find<CartController>().getCartHistoryList();
    Map<String, int> cartItemPerOrder = Map();

    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    List<int> cartOrderTimeToList() {
      return cartItemPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> orderItems = cartOrderTimeToList();
    var listCounter = 0;

    return Scaffold(
        body: Column(
      children: [
        Container(
          color: AppColors.mainColor,
          width: double.maxFinite,
          height: Dimensions.height10 * 10,
          padding: EdgeInsets.only(top: Dimensions.height45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BigText(text: "Cart History"),
              const AppIcon(
                icon: Icons.shopping_cart_outlined,
                iconColor: AppColors.mainColor,
                backgroundColor: AppColors.yellowColor,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.height20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView(
                children: [
                  for (int i = 0; i < orderItems.length; i++)
                    Container(
                      height: Dimensions.height30*4,
                      margin: EdgeInsets.only(bottom: Dimensions.height20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(text: getCartHistoryList[listCounter].time.toString()),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children:
                                      List.generate(orderItems[i], (index) {
                                    if (listCounter <
                                        getCartHistoryList.length) {
                                      listCounter++;
                                    }
                                    return index <= 2
                                        ? Container(
                                            height: 80,
                                            width: 80,
                                            margin: EdgeInsets.only(
                                                right: Dimensions.height10 / 2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius15 /
                                                            2),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        AppConstants.BASE_URL +
                                                            AppConstants
                                                                .UPLOAD_URL +
                                                            getCartHistoryList[
                                                                    listCounter -
                                                                        1]
                                                                .img!))),
                                            // child: ,
                                          )
                                        : Container();
                                  }),
                                ),                              
                                Container(
                                  height: Dimensions.height10*8,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SmallText(text: "Total",color: AppColors.titleColor),
                                      BigText(text: '${orderItems[i]} items',color: AppColors.titleColor),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,vertical: Dimensions.height10/2),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                          border: Border.all(width: 1,color: AppColors.mainColor)
                                        ),
                                        child: SmallText(text: "buy",color: AppColors.mainColor,),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ]),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  void setup(List<CartModel> getCartHistoryList) {}
}
