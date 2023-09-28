import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../utils/colors.dart';
import '../../widgets/app_text_field.dart';
import 'sign_up_page.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            //image
            Container(
              margin: EdgeInsets.only(top: Dimensions.screenHeight * 0.02),
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: Dimensions.radius20 * 4,
                    backgroundImage:
                        AssetImage("assets/image/logo part 1.png")),
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: Dimensions.width20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize:
                              Dimensions.font20 * 3 + Dimensions.font20 / 2,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sign into your account",
                      style: TextStyle(
                          fontSize: Dimensions.font20 * 2,
                          color: Colors.grey[500]),
                    ),
                  ]),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //email
            AppTextField(
              textController: emailController,
              text: "Email",
              icon: Icons.email_rounded,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //password
            AppTextField(
              textController: passController,
              text: "Password",
              icon: Icons.password_outlined,
            ),
            SizedBox(
              height: Dimensions.height20 + Dimensions.height20 / 2,
            ),

            //button
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteHelper.getInitial(),
                  (route) =>
                      false, 
                );
              },
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: BigText(
                    text: "Sign in",
                    size: Dimensions.font20 + Dimensions.font20 / 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height20 * 2,
            ),
            //tagline
            RichText(
                text: TextSpan(
                    text: "Don't have an account?",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Dimensions.font20),
                    children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => SignUpPage(),
                            transition: Transition.fadeIn),
                      text: "Create",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Dimensions.font20,
                          fontWeight: FontWeight.bold))
                ])),
          ],
        ),
      ),
    );
  }
}
