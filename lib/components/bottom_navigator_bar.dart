import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/refrigerator.svg'),
            activeIcon:
                SvgPicture.asset('assets/icons/refrigerator_active.svg'),
            label: '냉장고',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/record.svg'),
            activeIcon: SvgPicture.asset('assets/icons/record_active.svg'),
            label: '기록',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/add.svg'),
            activeIcon: SvgPicture.asset('assets/icons/add_active.svg'),
            label: '식재료 추가',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/search.svg'),
            activeIcon: SvgPicture.asset('assets/icons/search_active.svg'),
            label: '레시피 찾기',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/my.svg'),
            activeIcon: SvgPicture.asset('assets/icons/my_active.svg'),
            label: '마이',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => navigationShell.goBranch(index),
      ),
    );
  }
}
