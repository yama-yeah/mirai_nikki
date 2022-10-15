import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/domain/model/posts_model.dart';
import 'package:mirai_nikki/domain/model/user_model.dart';
import 'package:mirai_nikki/domain/state/user_state.dart';
import 'package:mirai_nikki/ui/home/home_controller.dart';
import 'package:mirai_nikki/ui/home/home_ui_model.dart';
import 'package:mirai_nikki/ui/widget/diary_fragment.dart';
import 'package:mirai_nikki/ui/widget/main_divider.dart';

class HomeView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HomeContent(
      ref.watch(homeControllerProvider),
      ref.watch(homeUiModelProvider),
    );
  }
}

class HomeContent extends HookConsumerWidget {
  final HomeController _controller;
  final HomeUiModel _state;
  const HomeContent(this._controller, this._state, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      if (_state.posts.isLoaded) {
        EasyLoading.dismiss();
      } else {
        EasyLoading.show(status: 'loading...');
      }
    }, [_state.posts.isLoaded]);
    final flag = useState(false);
    final diary = <Widget>[];

    for (var post in _state.posts.list) {
      diary.add(DiaryFragment(
        post,
        uploadImage: _controller.updateImage,
      ));
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
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 4),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const FittedBox(
                    fit: BoxFit.fill,
                    child: Icon(Icons.add),
                  ),
                  onPressed: () async {
                    if (EasyLoading.isShow) {
                      Logger().d("You now loading\nWait!!!!");
                    } else {
                      EasyLoading.show(status: 'loading...');
                      await _controller.addPost().then((value) {
                        flag.value = false;
                        EasyLoading.dismiss();
                        // Logger().wtf(jsonEncode(value.toJson()));
                        // final encodedJson =
                        //     Uri.encodeComponent(jsonEncode(value.toJson()));
                        // Logger().d(encodedJson);
                        context.push("""/awesome""", extra: value);
                      });
                      flag.value = true;
                    }
                  },
                ),
              ),
            ),
          ),
          ..._state.posts.isLoaded
              ? []
              : [
                  Scaffold(
                    backgroundColor: Colors.black.withOpacity(0.9),
                  )
                ],
        ],
      ),
    );
  }
}
