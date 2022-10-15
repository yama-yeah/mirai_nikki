import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomeView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Column(children: [
        Container(),
        Spacer(),
        Text(
          "よていにっきへようこそ",
          style: TextStyle(fontSize: 20),
        ),
        Spacer(),
        Text(
          "今からあなたには",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "性格診断を受けてもらいます",
          style: TextStyle(fontSize: 20),
        ),
        Spacer(),
        Text(
          "あなたの未来は性格によって決まります",
          style: TextStyle(fontSize: 20),
        ),
        Spacer(),
        Text(
          "どうか、あなたの未来が",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "無事であらんことを",
          style: TextStyle(fontSize: 20),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "性格診断へ進む",
            style: TextStyle(fontSize: 15),
          ),
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.lightBlueAccent,
            foregroundColor: Colors.black,
          ),
        ),
        Spacer()
      ]),
    );
  }
}
