import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/ui/widget/main_divider.dart';

class AwesomeView extends HookConsumerWidget {
  final PostModel post;
  const AwesomeView(this.post, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Column(children: [
        const Spacer(
          flex: 2,
        ),
        const Text(
          "あなたの週末の日記は",
          style: TextStyle(fontSize: 30),
        ),
        const Spacer(
          flex: 1,
        ),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              mainDivider,
              const SizedBox(
                height: 20,
              ),
              Text(
                post.title,
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                post.description,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              mainDivider,
            ],
          ),
        ),
        const Spacer(),
        const Text(
          "です",
          style: const TextStyle(fontSize: 25),
        ),
        Spacer(),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.lightBlueAccent,
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              context.pop();
            },
            child: Container(
              height: 50,
              width: 80,
              child: Text("OK"),
              alignment: Alignment.center,
            )),
        const Spacer(
          flex: 2,
        ),
      ]),
    );
  }
}
