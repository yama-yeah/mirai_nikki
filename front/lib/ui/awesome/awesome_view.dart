import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
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
        const Text("あなたの週末の日記は"),
        Container(
          color: Colors.white,
          child: Column(
            children: [
              mainDivider,
              Text(post.title),
              Text(post.description),
              mainDivider,
            ],
          ),
        ),
        const Text("です"),
      ]),
    );
  }
}
