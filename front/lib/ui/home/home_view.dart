import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/domain/model/posts_model.dart';
import 'package:mirai_nikki/domain/model/user_model.dart';
import 'package:mirai_nikki/domain/state/user_state.dart';
import 'package:mirai_nikki/ui/home/home_controller.dart';
import 'package:mirai_nikki/ui/widget/diary_fragment.dart';
import 'package:mirai_nikki/ui/widget/main_divider.dart';

class HomeView extends HookConsumerWidget {
  final HomeController _controller;
  final PostsModel _state;
  const HomeView(this._controller, this._state, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMounted = useIsMounted();
    void login() async {
      await _controller.addPost().then((value) {
        Logger().wtf("Aaaa");
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          if (isMounted()) {
            context.push('/welcome');
          }
        });
      });
    }

    final diary = <Widget>[];

    for (var post in _state.list) {
      diary.add(DiaryFragment(post));
    }
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                alignment: Alignment.center,
                height: 120,
                child: Image.asset(
                  "assets/logo/logo.png",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ...diary,
              mainDivider,
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black, width: 4),
                    shape: BoxShape.circle),
                child: IconButton(
                  icon: const FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(Icons.add),
                  ),
                  onPressed: login,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
