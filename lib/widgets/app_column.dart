import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';
import '../../../widgets/icon_and_text_widget.dart';
import '../../../widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) =>
                      Icon(Icons.star, color: AppColors.mainColor, size: 15)),
            ),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: "6174"),
            SizedBox(
              width: Dimensions.height10,
            ),
            SmallText(text: "comments"),
          ],
        ),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconsAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Normal",
              iconColor: AppColors.iconColor1,
            ),
            IconsAndTextWidget(
              icon: Icons.location_on,
              text: "1.7km",
              iconColor: AppColors.iconColor1,
            ),
            IconsAndTextWidget(
              icon: Icons.access_time_filled_sharp,
              text: "32min",
              iconColor: AppColors.iconColor1,
            )
          ],
        )
      ],
    );
  }
}
