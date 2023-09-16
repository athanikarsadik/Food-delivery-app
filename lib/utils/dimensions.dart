import 'package:get/get.dart';

//(392.7272 , 872.7272)

class Dimensions{
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight/3.96;
  static double pageView = screenHeight/2.72;
  static double pageViewTextContainer = screenHeight/7.26;

  //dynamic height for padding and margin
  static double height10 = screenHeight/87.2;
  static double height15 = screenHeight/58.18;
  static double height20 = screenHeight/43.63;
  static double height30 = screenHeight/29.09;
  static double height45 = screenHeight/19.39;

  //dynamic width for padding and margin
  static double width10 = screenHeight/87.2;
  static double width15 = screenHeight/58.18;
  static double width20 = screenHeight/43.63;
  static double width30 = screenHeight/29.09;
  static double width45 = screenHeight/19.39;
  
  static double font16 = screenHeight/54.5; //(844/16)
  static double font20 = screenHeight/43.6;
  static double font26 = screenHeight/33.53;

  //Radius
  static double radius15 = screenHeight/58.13;
  static double radius20 = screenHeight/43.6;
  static double radius30 = screenHeight/29.06;

  //Icon size
  static double iconSize24 = screenHeight/36.33;
  static double iconSize16 = screenHeight/54.5;

  //widht:390,height:844
  //ListView size
  static double listViewImg = screenWidth/3.27;
  static double listViewTextContSize = screenWidth/3.92;

  //Popular food
  static double popularFoodImgSize = screenHeight/2.49;

  //bottom height
  static double bottomHeightBar = screenHeight/7.26;
}