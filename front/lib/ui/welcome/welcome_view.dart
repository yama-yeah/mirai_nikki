import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomeView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Column(children: [
        Container(),
        const Spacer(),
        const Text(
          "よていにっきへようこそ",
          style: TextStyle(fontSize: 20),
        ),
        const Spacer(),
        const Text(
          "今からあなたには",
          style: TextStyle(fontSize: 20),
        ),
        const Text(
          "性格診断を受けてもらいます",
          style: TextStyle(fontSize: 20),
        ),
        const Spacer(),
        const Text(
          "あなたの未来は性格によって決まります",
          style: TextStyle(fontSize: 20),
        ),
        const Spacer(),
        const Text(
          "どうか、あなたの未来が",
          style: TextStyle(fontSize: 20),
        ),
        const Text(
          "無事であらんことを",
          style: TextStyle(fontSize: 20),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            context.go("/personal");
          },
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.lightBlueAccent,
            foregroundColor: Colors.black,
          ),
          child: const Text(
            "性格診断へ進む",
            style: TextStyle(fontSize: 15),
          ),
        ),
        const Spacer()
      ]),
    );
  }
}
