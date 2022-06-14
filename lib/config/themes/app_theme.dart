import 'package:clean_arch/core/utils/app_fonts.dart';
import 'package:clean_arch/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const _colorSchemeLight = ColorScheme(
    primary: Color(0xff2B76B7),
    primaryContainer: Color(0xff4A4A4A),
    secondary: Color(0xffB4B4B4),
    background: Color(0xFFFFFFFF),
    surface: Color(0xffF1F1F1),
    error: Colors.red,
    onSecondary: Color(0xFFC5C5C5),
    onSurface: Color(0xff707F89),
    onPrimary: Color(0xffffffff),
    onBackground: Color(0xff00D787),
    onError: Color(0xffE8F0F7),
    brightness: Brightness.light,
  );

  static const _colorSchemeDark = ColorScheme(
    primary: Color(0xff2B76B7),
    primaryContainer: Color(0xffcccccc),
    secondary: Color(0xffB4B4B4),
    background: Color(0xFF333333),
    surface: Color(0xFF444444),
    error: Colors.red,
    onSecondary: Color(0xFFC5C5C5),
    onSurface: Color(0xff999999),
    onPrimary: Color(0xffffffff),
    onBackground: Color(0xff00D787),
    onError: Color(0xffE8F0F7),
    brightness: Brightness.dark,
  );

  static InputDecoration searchInputDecoration(BuildContext context,
      {required Brightness brightness}) {
    return const TextField().decoration!.copyWith(
          hintStyle: Theme.of(context).textTheme.overline?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
//        fontWeight: MyFontWeight.medium,
              ),
          fillColor: Theme.of(context).colorScheme.background,
          contentPadding: const EdgeInsets.symmetric(horizontal: 1),
          filled: true,
          prefixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(start: 6),
            child: Icon(
              Icons.search,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
              size: 25,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
                width: 2,
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(20),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2,
                color:
                    Theme.of(context).colorScheme.secondary.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2, color: Theme.of(context).colorScheme.primary),
            borderRadius: BorderRadius.circular(20),
          ),
        );
  }

  static ColorScheme _getCurrentColorScheme({required Brightness brightness}) {
    return (brightness) == Brightness.dark
        ? _colorSchemeDark
        : _colorSchemeLight;
  }

  ThemeData getTheme(Brightness brightness) {
    var colorScheme = _getCurrentColorScheme(brightness: brightness);
    var textTheme = _getTextTheme(brightness: brightness);
    return ThemeData(
      useMaterial3: true,
      fontFamily: AppStrings.appFont,
      scaffoldBackgroundColor: colorScheme.background,
      backgroundColor: colorScheme.background,
      colorScheme: colorScheme,
      dialogTheme: const DialogTheme(),
      appBarTheme: AppBarTheme(
        titleSpacing: 0,
        titleTextStyle: textTheme.headline6!.copyWith(
          color: colorScheme.onBackground,
        ),
        elevation: 1,
        shadowColor: Colors.transparent,
        color: colorScheme.background,
        foregroundColor: colorScheme.onBackground,
        centerTitle: false,
      ),
      textTheme: textTheme,
//      elevatedButtonTheme:
//      MyButtonThemes.elevatedButtonThemeData(brightness: brightness),
//      textButtonTheme:
//          MyButtonThemes.transparentTextButton(brightness: brightness),
//      inputDecorationTheme: _inputDecorationTheme(brightness: brightness),
      cardTheme: CardTheme(
        color: colorScheme.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.transparent)),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all<Color>(colorScheme.onPrimary),
        fillColor: MaterialStateProperty.all<Color>(colorScheme.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(2),
        ),
        side: BorderSide(color: colorScheme.primary),
      ),
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(colorScheme.primary),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            AppTheme._getCurrentColorScheme(brightness: brightness).background,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: colorScheme.primary, size: 20),
        unselectedIconTheme: IconThemeData(
            color: colorScheme.secondaryContainer.withOpacity(.8), size: 26),
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.secondary,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedLabelStyle:
            AppTheme._getTextTheme(brightness: brightness).overline?.copyWith(
          fontWeight: MyFontWeight.medium,
                  height: 1,
                ),
        unselectedLabelStyle:
            AppTheme._getTextTheme(brightness: brightness).overline?.copyWith(
          fontWeight: MyFontWeight.medium,
                  height: 1,
                ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.background,
        elevation: 0.0,
        modalBackgroundColor: colorScheme.background,
        modalElevation: 0.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ),
    );
  }

  static TextTheme _getTextTheme({required Brightness brightness}) {
    var colorScheme = _getCurrentColorScheme(brightness: brightness);
    return TextTheme(
      headline6: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 16,
        fontWeight: MyFontWeight.bold,
      ),
      headline5: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 22,
        fontWeight: MyFontWeight.regular,
      ),
      headline4: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 30,
        fontWeight: MyFontWeight.regular,
      ),
      headline3: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 42,
        fontWeight: MyFontWeight.regular,
      ),
      headline2: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 58,
        fontWeight: MyFontWeight.light,
      ),
      headline1: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 90,
        fontWeight: MyFontWeight.light,
      ),
      bodyText1: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 12,
        fontWeight: MyFontWeight.regular,
      ),
      bodyText2: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 11,
        fontWeight: MyFontWeight.regular,
      ),
      caption: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 10,
        fontWeight: MyFontWeight.regular,
      ),
      overline: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 8,
        fontWeight: MyFontWeight.regular,
      ),
      subtitle1: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 12,
        fontWeight: MyFontWeight.regular,
      ),
      subtitle2: TextStyle(
        color: colorScheme.primaryContainer,
        fontSize: 12,
        fontWeight: MyFontWeight.medium,
      ),
      button: TextStyle(
        color: colorScheme.onPrimary,
        fontFamily: AppStrings.appFont,
        fontSize: 12,
        fontWeight: MyFontWeight.bold,
      ),
    ).apply(
      decorationColor: colorScheme.onSurface,
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );
  }
}
