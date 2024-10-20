import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool backButton;

  /// ### AppBar에서 필요한 기능들을 적용한 위젯
  /// `title` : AppBar 타이틀
  /// - `title = null`일 경우 로고 표시
  ///
  /// `backBtn` : 뒤로가기 버튼 표시 여부
  /// - 뒤로가기 버튼이 표시되는 경우가 더 많아서 기본 값은 `true`로 설정
  const CustomAppBar({
    super.key,
    this.title,
    this.backButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Text(title!)
          : SvgPicture.asset(
              'assets/icons/nutripic.svg',
              width: 126,
              height: 30,
            ),
      centerTitle: true,
      leading: backButton
          ? IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_ios),
            )
          : null,
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}
