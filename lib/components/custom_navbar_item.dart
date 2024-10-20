import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

BottomNavigationBarItem customNavBarItem({
  required String src,
  required String active,
  required String label,
}) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: SvgPicture.asset(src),
    ),
    activeIcon: Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 4),
      child: SvgPicture.asset(active),
    ),
    label: label,
  );
}
