import 'package:flutter/material.dart';
import 'package:nutripic/components/refrigerator/refrigerator_select_text.dart';
import 'package:nutripic/utils/palette.dart';

class RefrigeratorSelectContainer extends StatelessWidget {
  final int selected;
  final Function()? onTapRefrigerator;
  final Function()? onTapFreezer;
  final Function()? onTapCabinet;
  const RefrigeratorSelectContainer({
    super.key,
    required this.selected,
    required this.onTapRefrigerator,
    required this.onTapFreezer,
    required this.onTapCabinet,
  });

  @override
  Widget build(BuildContext context) {
    List<Alignment> alignment = [
      Alignment.centerLeft,
      Alignment.center,
      Alignment.centerRight
    ];

    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(80),
        boxShadow: [Palette.shadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            // 선택된 항목 배경
            AnimatedAlign(
              alignment: alignment[selected],
              duration: const Duration(milliseconds: 150),
              curve: Curves.fastOutSlowIn,
              child: Container(
                width: MediaQuery.of(context).size.width / 3 - 16,
                height: 54,
                decoration: BoxDecoration(
                  color: Palette.sub,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            // 텍스트
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 냉장
                RefrigeratorSelectText(
                  type: 0,
                  selected: selected,
                  onTap: onTapRefrigerator,
                ),

                // 냉동
                RefrigeratorSelectText(
                  type: 1,
                  selected: selected,
                  onTap: onTapFreezer,
                ),

                // 실온
                RefrigeratorSelectText(
                  type: 2,
                  selected: selected,
                  onTap: onTapCabinet,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
