import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: flexSchemeLight,
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      fillColor: flexSchemeLight.primary.withOpacity(0.1),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0.1,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0.1,
        ),
      ),
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w700,
        )
        // you can add others here
        ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: flexSchemeDark,
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      fillColor: flexSchemeDark.primary.withOpacity(0.1),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0.1,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(
          color: Colors.transparent,
          width: 0.1,
        ),
      ),
    ),
    textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(fontWeight: FontWeight.w700)

        // you can add others here
        ),
  );
}

// Light and dark ColorSchemes made by FlexColorScheme v7.3.1.
// These ColorScheme objects require Flutter 3.7 or later.
const ColorScheme flexSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff223a5e),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xff97baea),
  onPrimaryContainer: Color(0xff000000),
  secondary: Color(0xff144955),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffa9edff),
  onSecondaryContainer: Color(0xff000000),
  tertiary: Color(0xff208399),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffccf3ff),
  onTertiaryContainer: Color(0xff000000),
  error: Color(0xffb00020),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfffcd8df),
  onErrorContainer: Color(0xff000000),
  surface: Color(0xffffffff),
  onSurface: Color(0xff000000),
  surfaceContainerHighest: Color(0xffeeeeee),
  onSurfaceVariant: Color(0xff000000),
  outline: Color(0xff737373),
  outlineVariant: Color(0xffbfbfbf),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff121212),
  onInverseSurface: Color(0xffffffff),
  inversePrimary: Color(0xffaabbd5),
  surfaceTint: Color(0xff223a5e),
);

const ColorScheme flexSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff748bac),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xff1b2e4b),
  onPrimaryContainer: Color(0xffffffff),
  secondary: Color(0xff539eaf),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xff004e5d),
  onSecondaryContainer: Color(0xffffffff),
  tertiary: Color(0xff219ab5),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xff0f5b6a),
  onTertiaryContainer: Color(0xffffffff),
  error: Color(0xffcf6679),
  onError: Color(0xff000000),
  errorContainer: Color(0xffb1384e),
  onErrorContainer: Color(0xffffffff),
  surface: Color(0xff121212),
  onSurface: Color(0xffffffff),
  surfaceContainerHighest: Color(0xff323232),
  onSurfaceVariant: Color(0xffffffff),
  outline: Color(0xff8c8c8c),
  outlineVariant: Color(0xff404040),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xffffffff),
  onInverseSurface: Color(0xff000000),
  inversePrimary: Color(0xff3e4754),
  surfaceTint: Color(0xff748bac),
);
