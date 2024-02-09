import 'package:flutter/material.dart';

final IColors c = _ColorsMain();

abstract class IColors {
  Color get primary100;
  Color get primary200;
  Color get primary300;
  Color get primary400;
  Color get primary500;
  Color get primary600;
  Color get primary700;
  Color get primary800;
  Color get primary900;
  Color get primary950;
}

class _ColorsMain extends IColors {
  @override
  Color primary100 = const Color(0xffdfedff);

  @override
  Color primary200 = const Color(0xffc6dcff);

  @override
  Color primary300 = const Color(0xffa3c4fe);

  @override
  Color primary400 = const Color(0xff7fa1fa);

  @override
  Color primary500 = const Color(0xff607ff4);

  @override
  Color primary600 = const Color(0xff5367ea);

  @override
  Color primary700 = const Color(0xff3546cd);

  @override
  Color primary800 = const Color(0xff2e3da5);

  @override
  Color primary900 = const Color(0xff2c3883);

  @override
  Color primary950 = const Color(0xff1a204c);
}
