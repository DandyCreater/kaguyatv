import 'package:eko_projects/presentation/resources/font_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle _getTextStyle(
    double fontSize, var fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    fontWeight: fontWeight,
    color: color,
  );
}

//regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, GoogleFonts.robotoCondensed(),
      FontWeightManager.regular, color);
}

//light text style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, GoogleFonts.robotoCondensed(), FontWeightManager.light, color);
}

//Medium Text Style
TextStyle geMediumStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
      fontSize, GoogleFonts.robotoCondensed(), FontWeightManager.medium, color);
}

//SemiBold TextStyle
TextStyle getsemiBoldStyle(
    {double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize, GoogleFonts.robotoCondensed(),
      FontWeightManager.semiBold, color);
}

//Bold TextStyle
TextStyle getBoldStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(
    fontSize,
    GoogleFonts.robotoCondensed(),
    FontWeightManager.bold,
    color,
  );
}
