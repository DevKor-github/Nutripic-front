import 'package:flutter/material.dart';
import 'package:nutripic/components/custom_app_bar.dart';
import 'package:nutripic/components/custom_button.dart';
import 'package:nutripic/components/custom_scaffold.dart';
import 'package:nutripic/components/refrigerator/refrigerator_container.dart';
import 'package:nutripic/components/refrigerator/refrigerator_select_container.dart';
import 'package:nutripic/utils/palette.dart';
import 'package:nutripic/view_models/refrigerator/refrigerator_view_model.dart';
import 'package:provider/provider.dart';

class RefrigeratorView extends StatelessWidget {
  const RefrigeratorView({super.key});

  @override
  Widget build(BuildContext context) {
    RefrigeratorViewModel refrigeratorViewModel =
        context.watch<RefrigeratorViewModel>();

    return CustomScaffold(
      appBar: const CustomAppBar(backButton: false),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 26),

          // 헤더
          Row(
            children: [
              const Text('나의 냉장고', style: Palette.heading),
              const Spacer(),

              // 정렬
              const Text('추가한 순', style: Palette.body),
              const SizedBox(width: 15),

              // 선택 버튼
              CustomButton(label: '선택', onPressed: () {})
            ],
          ),
          const SizedBox(height: 12),

          // 냉장고
          const RefrigeratorContainer(
            foods: [],
            addFood: null,
          ),
          const SizedBox(height: 15),

          // 냉장고 선택 버튼
          RefrigeratorSelectContainer(
            selected: refrigeratorViewModel.selected,
            onTapRefrigerator: refrigeratorViewModel.onTapRefrigerator,
            onTapFreezer: refrigeratorViewModel.onTapFreezer,
            onTapCabinet: refrigeratorViewModel.onTapCabinet,
          ),
          const SizedBox(height: 34),
        ],
      ),
    );
  }
}
