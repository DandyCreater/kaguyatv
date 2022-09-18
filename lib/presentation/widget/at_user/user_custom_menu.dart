import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserCustomMenuWidget extends StatelessWidget {
  final Function() press;
  final String title;
  final String imageUrl;
  final Color color;
  const UserCustomMenuWidget(
      {Key? key,
      required this.press,
      required this.title,
      required this.imageUrl,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Divider(
          thickness: 2,
          color: ColorManager.dividerColor,
        ),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        GestureDetector(
          onTap: press,
          child: Row(
            children: [
              SizedBox(
                height: screenHeight * 0.05,
                width: screenWidth * 0.1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SvgPicture.asset(
                    imageUrl,
                    // height: screenHeight * 0.05,
                    // width: screenWidth * 0.05,
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                height: screenHeight * 0.05,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    title,
                    style: GoogleFonts.robotoCondensed(
                      color: color,
                      fontSize: FontSize.s20,
                      fontWeight: FontWeightManager.regular,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenHeight * 0.03,
        ),
      ],
    );
  }
}
