// ignore_for_file: avoid_classes_with_only_static_members

import 'package:design_system/dimens.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData themeData = _buildTheme();

  static ThemeData _buildTheme() {
    final ThemeData baseTheme = ThemeData.light();

    final textTheme = buildTextTheme(
      defaultPolice: FontFamily.gilroy,
      textColor: FigmaColors.black,
    );

    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: FigmaColors.lightGray,
        toolbarTextStyle: textTheme.headline3,
        titleTextStyle: textTheme.headline3,
        iconTheme: const IconThemeData(color: FigmaColors.black),
        actionsIconTheme: const IconThemeData(color: FigmaColors.black),
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: FigmaColors.blue,
        ),
        unselectedIconTheme: IconThemeData(
          color: FigmaColors.bottomNavGray,
        ),
        selectedItemColor: FigmaColors.blue,
        unselectedItemColor: FigmaColors.bottomNavGray,
        backgroundColor: FigmaColors.white,
      ),
      fontFamily: FontFamily.gilroy,
      disabledColor: FigmaColors.extraLightGray,
      unselectedWidgetColor: FigmaColors.gray,
      primaryColor: FigmaColors.white,
      primaryColorDark: FigmaColors.black,
      buttonTheme: baseTheme.buttonTheme.copyWith(
        buttonColor: FigmaColors.black,
        //splashColor: Colors.transparent,
        //highlightColor: Colors.transparent,
        textTheme: ButtonTextTheme.primary,
      ),
      chipTheme: baseTheme.chipTheme.copyWith(
        pressElevation: 0,
      ),
      iconTheme: baseTheme.iconTheme.copyWith(color: FigmaColors.black),
      scaffoldBackgroundColor: FigmaColors.lightGray,
      cardColor: FigmaColors.white,
      textSelectionTheme: baseTheme.textSelectionTheme.copyWith(
        selectionColor: FigmaColors.blue,
      ),
      selectedRowColor: FigmaColors.blue,
      // TODO(nsalleron): check
      backgroundColor: FigmaColors.white,
      toggleableActiveColor: FigmaColors.toggleGreen,
      // GeneratedFigmaColors.outline should be default color https://jira.vsct.fr/browse/IVTS-3316
      textTheme: textTheme,
      inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
        contentPadding: const EdgeInsets.all(Dimens.halfPadding),
        //TODO(nsalleron): check
        labelStyle: const TextStyle(
          fontSize: Dimens.subtitle2LineHeight,
          color: FigmaColors.black,
          fontFamily: FontFamily.gilroy,
        ),
        prefixStyle: const TextStyle(
          fontSize: Dimens.subtitle2LineHeight,
          color: FigmaColors.black,
          fontFamily: FontFamily.gilroy,
        ),
        //errorStyle: const TextStyle(fontSize: Dimens.*, color: FigmaColors.*, fontFamily: FontFamily.gilroy), //TODO(nsalleron): check
        errorMaxLines: 3,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: FigmaColors.lightGray),
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.defaultRadius),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: FigmaColors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.defaultRadius),
          ),
        ),
        //errorBorder: //TODO(nsalleron): check
        //focusedErrorBorder: //TODO(nsalleron): check
        focusedBorder: const OutlineInputBorder(
          //TODO(nsalleron): check
          borderSide: BorderSide(color: FigmaColors.black),
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.defaultRadius),
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          //TODO(nsalleron): check
          borderSide: BorderSide(color: FigmaColors.lightGray),
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.defaultRadius),
          ),
        ),
      ),
      cardTheme: CardTheme(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimens.defaultRadius)),
      ),
      tabBarTheme: TabBarTheme(
        labelStyle: textTheme.subtitle1,
        labelColor: FigmaColors.blue,
        unselectedLabelStyle: textTheme.subtitle1,
        unselectedLabelColor: FigmaColors.bottomNavGray,
      ),
    );
  }
}

class FontFamily {
  static const String gilroy = 'gilroy';
}

TextTheme buildTextTheme({required String defaultPolice, required Color textColor}) {
  return TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Dimens.h1TextSize,
      //height: Dimens.h1LineHeight,
      color: textColor,
      fontFamily: defaultPolice,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Dimens.h2TextSize,
      //height: Dimens.h2LineHeight,
      color: textColor,
      fontFamily: defaultPolice,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Dimens.h3TextSize,
      //height: Dimens.h3LineHeight,
      color: textColor,
      fontFamily: defaultPolice,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Dimens.body1TextSize,
      //height: Dimens.body1LineHeight,
      fontStyle: FontStyle.normal,
      color: textColor,
      fontFamily: defaultPolice,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Dimens.body2TextSize,
      //height: Dimens.body2LineHeight,
      color: textColor,
      fontFamily: defaultPolice,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Dimens.subtitle1TextSize,
      //height: Dimens.subtitle1LineHeight,
      color: textColor,
      fontFamily: defaultPolice,
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: Dimens.subtitle2TextSize,
      //height: Dimens.subtitle2LineHeight,
      color: textColor,
      fontFamily: defaultPolice,
    ),
  );
}

final _figmaAlternativeColors = FigmaColors();

extension FigmaTheme on ThemeData {
  FigmaColors get figmaColors => _figmaAlternativeColors;

  TextTheme get figmaTextStyle => buildTextTheme(defaultPolice: FontFamily.gilroy, textColor: FigmaColors.black);
}

class FigmaColors {
  // static const Color black = Color(0xFF000000);
  // static const Color darkGray = Color(0xFF777777);
  // static const Color gray = Color(0xFFB8B8B8);
  static const Color mediumGray = Color(0xFFE5E5E5);
  static const Color extraMediumGray = Color(0xFFF4F4F4);

  // static const Color lightGray = Color(0xFFDDDDDD);
  static const Color extraLightGray = Color(0xFFF0F0F0);

  static const Color white = Color(0xFFFFFFFF);
  static const Color bottomNavGray = Color(0xFF888888);
  static const Color toggleGreen = Color(0xFF65C466);
  static const Color calendarHeader = Color(0xFF828282);
  static const Color separatorColor = Color(0xFFBDBDBD);
  static const Color calendarUnselectedColor = Color(0xFFF7F7F7);
  static const Color calendarSelectedColor = Color(0xFF6FCF97);
  static const Color calendarDayColor = Color(0xFF8FE9CE);
  static const Color calendarMissionDayColor = Color(0XFFFDEBDF);
  static const Color calendarSelectedDayColor = Color(0xFF4F72EF);
  static const Color pharmacyBoxColor = Color(0xFFF2F2F2);
  static const Color pharmacyTimeColor = Color(0xFF333333);

  static const Color lightGreen = Color(0xFFE6F7EF);
  static const Color green = Color(0xFF8FE9CE);
  static const Color darkGreen = Color(0xFF36C397);
  static const Color lightBlue = Color(0xFFDCE8FF);
  static const Color blue = Color(0xFFA8BBFF);
  static const Color darkBlue = Color(0xFF4F72EF);
  static const Color lightCoral = Color(0xFFFDEBDF);
  static const Color coral = Color(0xFFEAB898);
  static const Color darkCoral = Color(0xFFE0885B);
  static const Color lightYellow = Color(0xFFFFFAE9);
  static const Color yellow = Color(0xFFFFF4CD);
  static const Color darkYellow = Color(0xFFFDCE2E);
  static const Color lightGray = Color(0xFFF7F7F7);
  static const Color gray = Color(0xFFD8D8D8);
  static const Color darkGray = Color(0xFF9C9C9C);

  //static const Color white = Color(0xFFFCFCFC);
  static const Color black = Color(0xFF141414);
  static const Color lightError = Color(0xFFFDBBB6);
  static const Color error = Color(0xFFDF503F);
  static const Color darkError = Color(0xFFB94134);
  static const Color transparent = Color(0x00000000);
  static const Color arpilabeGreen = Color(0xFFCFF7E6);
}
