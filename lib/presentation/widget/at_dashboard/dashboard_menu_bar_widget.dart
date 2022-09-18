import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardMenuBarWidget extends StatelessWidget {
  final Function() press;
  final String imageUrl;
  final String title;
  final bool pressed;
  const DashboardMenuBarWidget(
      {Key? key,
      required this.pressed,
      required this.press,
      required this.imageUrl,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: press,
      child: Row(
        children: [
          SizedBox(
            height: screenHeight * 0.04,
            width: screenWidth * 0.06,
            child: Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(
                imageUrl,
                height: 40,
                width: 40,
                color: pressed
                    ? ColorManager.whitePrimary
                    : ColorManager.transparentButton,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: screenHeight * 0.04,
            child: Container(
              padding: const EdgeInsets.only(top: 9),
              child: Center(
                child: Text(title,
                    style: GoogleFonts.robotoCondensed(
                        fontSize: FontSize.s16,
                        color: pressed
                            ? ColorManager.whitePrimary
                            : ColorManager.transparentButton,
                        fontWeight: FontWeightManager.semiBold)),
              ),
            ),
          ),
          SizedBox(
            width: screenWidth * 0.05,
          ),
        ],
      ),
    );
  }
}
