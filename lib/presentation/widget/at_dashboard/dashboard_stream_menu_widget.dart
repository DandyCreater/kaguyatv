import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DashboardStreamingMenuWidget extends StatelessWidget {
  final Function() press;
  final String imageUrl;
  final String title;
  final String duration;
  const DashboardStreamingMenuWidget(
      {Key? key,
      required this.press,
      required this.imageUrl,
      required this.title,
      required this.duration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenHeight * 0.16,
            width: screenWidth * 0.45,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(2)),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: GoogleFonts.robotoCondensed(
                fontSize: FontSize.s14,
                color: ColorManager.whitePrimary,
                fontWeight: FontWeightManager.regular),
          ),
          const SizedBox(
            height: 2,
          ),
          GradientText(
            // ignore: prefer_interpolation_to_compose_strings
            duration + " watching now",
            style: GoogleFonts.robotoCondensed(
              fontSize: FontSize.s12,
            ),
            colors: [
              ColorManager.firstColorStyle,
              ColorManager.secondColorStyle,
              ColorManager.thirdColorStyle,
              ColorManager.fourthColorStyle,
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.all(1),
            height: screenHeight * 0.05,
            width: screenWidth * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              gradient: LinearGradient(
                colors: [
                  ColorManager.firstColorButton,
                  ColorManager.secondColorButton,
                ],
              ),
            ),
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(ColorManager.primaryColor),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ))),
                onPressed: press,
                child: Text(
                  "Live Now",
                  style: GoogleFonts.robotoCondensed(
                      fontSize: FontSize.s12,
                      color: ColorManager.whitePrimary,
                      fontWeight: FontWeightManager.regular),
                )),
          )
        ],
      ),
    );
  }
}
