import 'package:flutter/material.dart';

class Palette {
  /* Component colors */
  /// #A8E6CF
  static const Color primary = Color(0xFFA8E6CF);

  /// #FB934E
  static const Color secondary = Color(0xFFFB934E);

  /// #296C53
  static const Color sub = Color(0xFF296C53);

  /// #F85B49
  static const Color delete = Color(0xFFF85B49);

  /// #F1FAF9
  static const Color background = Color(0xFFF1FAF9);

  /* Label colors */
  /// #252525
  static const Color black = Color(0xFF252525);

  /// #2E3137
  static const Color gray900 = Color(0xFF2E3137);

  /// #444554
  static const Color gray800 = Color(0xFF444554);

  /// #5B5D6B
  static const Color gray700 = Color(0xFF5B5D6B);

  /// #777986
  static const Color gray500 = Color(0xFF777986);

  /// #9496A1
  static const Color gray400 = Color(0xFF9496A1);

  /// #B3B5BD
  static const Color gray200 = Color(0xFFB3B5BD);

  /// #DBDDE7
  static const Color gray100 = Color(0xFFDBDDE7);

  /// #F9F9F9
  static const Color gray50 = Color(0xFFF9F9F9);

  /// #FFFFFF
  static const Color white = Color(0xFFFFFFFF);

  /* Text Styles */

  /// Font size: 24
  /// <br />Font weight: Bold
  static const TextStyle heading =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w700);

  /// Font size: 20
  /// <br />Font weight: Bold
  static const TextStyle title =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w700);

  /// Font size: 14
  /// <br />Font weight: Semibold
  static const TextStyle subtitle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w600);

  /// Font size: 14
  /// <br />Font weight: Regular
  static const TextStyle body =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  /* Shadows */
  static BoxShadow shadow =
      BoxShadow(color: gray200.withOpacity(0.25), blurRadius: 15);
}
