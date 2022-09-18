import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPlayWidget extends StatelessWidget {
  final Color color;
  final String imageUrl;
  final String title;
  final Function() press;
  const CustomPlayWidget(
      {Key? key,
      required this.color,
      required this.imageUrl,
      required this.title,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      splashColor: Colors.transparent,
      onTap: press,
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.06,
            width: screenWidth * 0.06,
            child: SvgPicture.asset(
              imageUrl,
              color: color,
            ),
          ),
          SizedBox(
            height: screenHeight * 0.0005,
          ),
          Text(
            title,
            style: GoogleFonts.robotoCondensed(
              fontSize: FontSize.s12,
              fontWeight: FontWeightManager.regular,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
