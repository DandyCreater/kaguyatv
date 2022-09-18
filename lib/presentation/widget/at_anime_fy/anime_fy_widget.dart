import 'package:eko_projects/presentation/resources/color_manager.dart';
import 'package:eko_projects/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeFyWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function() press;
  const AnimeFyWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.95), Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstATop,
            child: Container(
              height: screenHeight * 0.26,
              width: screenWidth * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(imageUrl), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: SizedBox(
                height: screenHeight * 0.26,
                width: screenWidth * 0.25,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    title,
                    style: GoogleFonts.robotoCondensed(
                        fontSize: FontSize.s10,
                        color: ColorManager.whitePrimary,
                        fontWeight: FontWeightManager.regular),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
