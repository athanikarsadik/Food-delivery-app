import 'package:flutter/material.dart';

import '../../../utils/dimensions.dart';
import '../../../widgets/app_icon.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children:[
          Positioned(
              left:0,
              right:0,
            child:Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image:DecorationImage(
                  fit:BoxFit.cover,
                  image:AssetImage(
                  "assets/image/food0.png",
                ) 
                )
              ),
            ),
          ) ,         
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios_new_rounded),
                AppIcon(icon: Icons.shopping_cart_checkout_rounded),
              ],
            ),
          ),
        ]
      ),
    );
  }
}