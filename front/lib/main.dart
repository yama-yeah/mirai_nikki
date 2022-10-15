import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mirai_nikki/domain/const/const.dart';
import 'package:mirai_nikki/domain/model/personal_model.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/domain/model/posts_model.dart';
import 'package:mirai_nikki/domain/model/user_model.dart';
import 'package:mirai_nikki/domain/state/user_state.dart';
import 'package:mirai_nikki/initialize.dart';
import 'package:mirai_nikki/ui/awesome/awesome_view.dart';
import 'package:mirai_nikki/ui/home/home_controller.dart';
import 'package:mirai_nikki/ui/home/home_view.dart';
import 'package:mirai_nikki/ui/personal/personal_view.dart';
import 'package:mirai_nikki/ui/result/result_view.dart';
import 'package:mirai_nikki/ui/welcome/welcome_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(_routerProvider);
    final initializeController =
        ref.read(initializeStateNotifierProvider.notifier);
    useEffect(() {
      initializeController.initialize();
      return null;
    }, []);
    Logger().d("welcome ${ref.watch(userStateProvider)}");
    return MaterialApp.router(
      routerConfig: router,
      title: 'GoRouter Example',
      builder: EasyLoading.init(),
    );
  }
}

final _routerProvider = Provider(
  (ref) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeView(),
        ),
        GoRoute(
          path: '/welcome',
          builder: (context, state) => WelcomeView(),
        ),
        GoRoute(
          path: '/awesome',
          builder: (context, state) {
            // final query = state.queryParams['query'];
            // final decoded = Uri.decodeComponent(query!);
            //Logger().wtf(query);
            return AwesomeView(state.extra! as PostModel);
          },
        ),
        GoRoute(
          path: "/personal",
          builder: (context, state) {
            return PersonalView();
          },
        ),
        GoRoute(
          path: '/result',
          builder: (context, state) {
            Logger().wtf("re");
            return ResultView(state.extra! as PersonalModel);
          },
        ),
      ],
      redirect: (context, state) {
        final user = ref.watch(userStateProvider);
        Logger().d("redirect:${state.subloc}");
        if (state.subloc == "/welcome" || state.subloc == "/personal") {
          return null;
        }
        return user != const UserModel() ? null : "/welcome";
      },
    );
  },
);
