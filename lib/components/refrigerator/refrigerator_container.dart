import 'package:flutter/material.dart';
import 'package:nutripic/components/food_tile.dart';
import 'package:nutripic/objects/food.dart';
import 'package:nutripic/utils/palette.dart';

class RefrigeratorContainer extends StatelessWidget {
  final List<Food> foods;
  final Function()? addFood;
  const RefrigeratorContainer({
    super.key,
    required this.foods,
    required this.addFood,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [Palette.shadow],
        ),
        child: foods.isEmpty
            // 식재료 리스트가 없으면 추가 버튼 생성
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: addFood,
                      icon: const Icon(
                        Icons.add_circle_rounded,
                        size: 56,
                        color: Palette.sub,
                      ),
                    ),
                    const Text('식재료를 추가해보세요', style: Palette.body),
                  ],
                ),
              )
            // 식재료 리스트가 있으면 GridView 생성
            : GridView.builder(
                itemCount: foods.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 25,
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) =>
                    const FoodTile(src: null, name: '식재료명'),
              ),
      ),
    );
  }
}
