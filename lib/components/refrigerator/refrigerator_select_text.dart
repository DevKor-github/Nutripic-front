import 'package:flutter/material.dart';
import 'package:nutripic/utils/palette.dart';

class RefrigeratorSelectText extends StatelessWidget {
  final int type;
  final int selected;
  final Function()? onTap;
  const RefrigeratorSelectText({
    super.key,
    required this.type,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> typeString = ['냉장', '냉동', '실온'];

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        // Container가 있어야 텍스트 외에도 탭 가능
        child: Container(
          color: Colors.transparent,
          height: 54,
          child: Center(
            child: Text(
              typeString[type],
              style: Palette.title.copyWith(
                fontWeight:
                    type == selected ? FontWeight.w600 : FontWeight.w400,
                color: type == selected ? Palette.white : Palette.gray500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
