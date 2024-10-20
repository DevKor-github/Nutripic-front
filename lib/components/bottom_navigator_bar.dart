import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutripic/components/custom_navbar_item.dart';
import 'package:nutripic/utils/palette.dart';

class BottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: false,
        selectedItemColor: Palette.sub,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          customNavBarItem(
            src: 'assets/icons/refrigerator.svg',
            active: 'assets/icons/refrigerator_active.svg',
            label: '냉장고',
          ),
          customNavBarItem(
            src: 'assets/icons/record.svg',
            active: 'assets/icons/record_active.svg',
            label: '기록',
          ),
          customNavBarItem(
            src: 'assets/icons/add.svg',
            active: 'assets/icons/add_active.svg',
            label: '식재료 추가',
          ),
          customNavBarItem(
            src: 'assets/icons/search.svg',
            active: 'assets/icons/search_active.svg',
            label: '레시피 찾기',
          ),
          customNavBarItem(
            src: 'assets/icons/my.svg',
            active: 'assets/icons/my_active.svg',
            label: '마이페이지',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => navigationShell.goBranch(index),
      ),
    );
  }
}
