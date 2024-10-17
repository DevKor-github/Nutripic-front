import 'package:go_router/go_router.dart';
import 'package:nutripic/components/bottom_navigator_bar.dart';
import 'package:nutripic/models/diary_model.dart';
import 'package:nutripic/models/user_model.dart';
import 'package:nutripic/view_models/diary/diary_post_view_model.dart';
import 'package:nutripic/view_models/diary/diary_view_model.dart';
import 'package:nutripic/view_models/login/login_view_model.dart';
import 'package:nutripic/view_models/login/signup_view_model.dart';
import 'package:nutripic/view_models/refrigerator/refrigerator_view_model.dart';
import 'package:nutripic/view_models/user_info/user_edit_view_model.dart';
import 'package:nutripic/view_models/user_info/user_info_view_model.dart';
import 'package:nutripic/views/diary/diary_view.dart';
import 'package:nutripic/views/login/signup_view.dart';
import 'package:nutripic/views/camera_view.dart';
import 'package:nutripic/views/diary/diary_post_view.dart';
import 'package:nutripic/views/login/login_view.dart';
import 'package:nutripic/views/recipe_view.dart';
import 'package:nutripic/views/refrigerator/refrigerator_view.dart';
import 'package:nutripic/views/user_info/user_edit_view.dart';
import 'package:nutripic/views/user_info/user_info_view.dart';
import 'package:provider/provider.dart';

class AppRouter {
  final UserModel userModel;
  final DiaryModel diaryModel;
  AppRouter({required this.diaryModel, required this.userModel});

  static GoRouter getRouter(UserModel userModel, DiaryModel diaryModel) {
    return GoRouter(
      initialLocation: '/login',
      redirect: (context, state) {
        // 사용자 데이터가 있으면 firebase 로그인이 완료된 상태
        // 사용자 데이터가 없으면 로그인 화면으로 이동, 있으면 홈 화면으로 이동
        if (userModel.uid == null) {
          // 회원가입 페이지로 이동만 허용
          if (state.fullPath == '/login/signup') {
            return null;
          }

          // 로그인이 되지 않은 상태에서 다른 페이지로 이동하려 하면 login 페이지로 리디렉팅
          return '/login';
        } else if (state.fullPath == '/login') {
          return '/refrigerator';
        } else {
          return null;
        }
      },
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) =>
              BottomNavBar(navigationShell: navigationShell),
          branches: [
            // 냉장고
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/refrigerator',
                  builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => RefrigeratorViewModel(
                      context: context,
                    ),
                    child: const RefrigeratorView(),
                  ),
                )
              ],
            ),

            // 식단일지
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/diary',
                  builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => DiaryViewModel(
                      diaryModel: diaryModel,
                      context: context,
                    ),
                    child: const DiaryView(),
                  ),
                  routes: [
                    GoRoute(
                      path: 'post',
                      builder: (context, state) {
                        return ChangeNotifierProvider(
                          create: (context) => DiaryPostViewModel(
                            diaryModel: diaryModel,
                            context: context,
                          ),
                          child: const DiaryPostView(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),

            // 카메라
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/camera',
                  builder: (context, state) => const CameraView(),
                )
              ],
            ),

            // 레시피
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/recipe',
                  builder: (context, state) => const RecipeView(),
                )
              ],
            ),

            // 사용자 정보
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/user',
                  builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => UserInfoViewModel(
                      userModel: userModel,
                      context: context,
                    ),
                    child: const UserInfoView(),
                  ),
                  routes: [
                    GoRoute(
                      path: 'edit',
                      builder: (context, state) => ChangeNotifierProvider(
                        create: (context) => UserEditViewModel(
                          userModel: userModel,
                          context: context,
                        ),
                        child: const UserEditView(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),

        // 로그인
        GoRoute(
          path: '/login',
          builder: (context, state) => ChangeNotifierProvider(
            create: (context) => LoginViewModel(
              userModel: userModel,
              context: context,
            ),
            child: const LoginView(),
          ),
          routes: [
            // 회원가입
            GoRoute(
              path: 'signup',
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => SignupViewModel(
                  userModel: userModel,
                  context: context,
                ),
                child: const SignupView(),
              ),
            )
          ],
        ),
      ],
    );
  }
}
