import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';

import '../../base/show_custom_msg.dart';
import '../../controllers/auth_controller.dart';
import '../../models/sign_up_model.dart';
import '../../utils/colors.dart';
import '../../widgets/app_text_field.dart';
import 'sign_in_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];

    void _registration() {
      var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passController.text.trim();

      if (name.isEmpty) {
        showCustomSnackbar("Enter your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackbar("Enter your phone number", title: "Phone Number");
      } else if (email.isEmpty) {
        showCustomSnackbar("Enter your email", title: "Email Address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackbar("Enter valid email", title: "Valid Email Address");
      } else if (password.isEmpty) {
        showCustomSnackbar("Enter your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackbar("Password length should be atleast 6 letters",
            title: "Password Length");
      } else {
        SignUpModel signUpModel = SignUpModel(email: email, name: name, phone: phone, password: password);
        authController.registration(signUpModel).then((status){
          if(status.isSuccess){
            //success
          }else{
            showCustomSnackbar(status.msg);
          }
        });
      }
    }

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
              height: Dimensions.height20,
            ),
            //name
            AppTextField(
              textController: nameController,
              text: "Name",
              icon: Icons.person,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            //Phone
            AppTextField(
              textController: phoneController,
              text: "Phone",
              icon: Icons.phone,
            ),
            SizedBox(
              height: Dimensions.height30 + Dimensions.height10,
            ),
            //button
            GestureDetector(
              onTap: () => _registration(),
              child: Container(
                width: Dimensions.screenWidth / 2,
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.mainColor,
                ),
                child: Center(
                  child: BigText(
                    text: "Sign up",
                    size: Dimensions.font20 + Dimensions.font20 / 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height15,
            ),
            //tagline
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => SignInPage(),
                          transition: Transition.fadeIn),
                    text: "Already have an account?",
                    style: TextStyle(
                        color: Colors.blue[300], fontSize: Dimensions.font20))),
            SizedBox(
              height: Dimensions.height20,
            ),
            RichText(
                text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "- Or sign up using -",
                    style: TextStyle(
                        color: Colors.grey[500], fontSize: Dimensions.font16))),
            Wrap(
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: EdgeInsets.all(Dimensions.height15),
                          child: CircleAvatar(
                            radius: Dimensions.radius30,
                            backgroundImage: AssetImage(
                                "assets/image/" + signUpImages[index]),
                          ),
                        ))),
          ],
        ),
      ),
    );
  }
}
