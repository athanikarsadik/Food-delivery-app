import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

import '../../widgets/account_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        title: BigText(
          text: "Profile",
          color: Colors.white,
          size: Dimensions.iconSize24,
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            //profile img
            AppIcon(
              icon: Icons.person_2_rounded,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height30 + Dimensions.height45,
              size: Dimensions.height15 * 10,
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //name
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.person_2_rounded,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height15 + Dimensions.height10,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Sadik"),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //phone
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height15 + Dimensions.height10,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "9766839560"),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //email
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.email_rounded,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height15 + Dimensions.height10,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "sadik@gmail.com"),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                    //address
                    AccountWidget(
                      appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: Dimensions.height15 + Dimensions.height10,
                        size: Dimensions.height10 * 5,
                      ),
                      bigText: BigText(text: "Fill in your address"),
                    ),
                    SizedBox(
                      height: Dimensions.height10,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
