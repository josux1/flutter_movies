import 'package:flutter/material.dart';
import 'package:flutter_movies/ui/utils/colors.dart';

final IText t = _TextStylesMain();

abstract class IText {
  TextStyle get title;
  TextStyle get titlePrimary;
  TextStyle get titleLight;
  TextStyle get titleWhite;
  TextStyle get subtitle;
  TextStyle get subtitleWhite;
  TextStyle get medium;
  TextStyle get mediumWhite;
  TextStyle get secondary;
  TextStyle get text;
  TextStyle get textPrimary;
  TextStyle get textWhite;
  TextStyle get textDisabled;
  TextStyle get textError;
}

class _TextStylesMain implements IText {
  static const String _mainFont = 'Lexend';

  @override
  TextStyle title = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle titlePrimary = TextStyle(
    fontFamily: _mainFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: c.primary500,
  );

  @override
  TextStyle titleLight = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 22,
    color: Colors.grey,
  );

  @override
  TextStyle titleWhite = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  TextStyle subtitle = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    // color: c.background
  );

  @override
  TextStyle subtitleWhite = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  TextStyle medium = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  @override
  TextStyle mediumWhite = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  @override
  TextStyle secondary = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 16,
    // color: Colors.black
  );

  @override
  TextStyle text = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 14,
    // color: Colors.black
  );

  @override
  TextStyle textPrimary = TextStyle(
    fontFamily: _mainFont,
    fontSize: 14,
    color: c.primary500,
  );

  @override
  TextStyle textWhite = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 14,
    color: Colors.white,
  );

  @override
  TextStyle textDisabled = TextStyle(
    fontFamily: _mainFont,
    fontSize: 14,
    color: Colors.grey.withOpacity(0.7),
  );

  @override
  TextStyle textError = const TextStyle(
    fontFamily: _mainFont,
    fontSize: 14,
    color: Colors.red,
  );
}
