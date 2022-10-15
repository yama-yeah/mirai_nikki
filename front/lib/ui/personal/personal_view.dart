import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/model/personal_model.dart';
import 'package:mirai_nikki/domain/util/personal_util.dart';
import 'package:mirai_nikki/ui/personal/personal_controller.dart';

class PersonalContent extends HookConsumerWidget {
  final PersonalController _controller;
  const PersonalContent(this._controller, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inputBools = useState<List<bool>>([]);
    final story = stores[inputBools.value.length];
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Image.asset(
                "assets/bg/personal_bg.png",
                fit: BoxFit.fitHeight,
              ).image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          children: [
            Container(),
            Spacer(
              flex: 3,
            ),
            Text(
              story.first,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Text(
              story.second,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                inputBools.value = [...inputBools.value, true];
                if (inputBools.value.length == 6) {
                  await _controller.register(inputBools.value).then((value) =>
                      context.go("/result",
                          extra: booleans2Personal(inputBools.value)));
                }
              },
              child: Container(
                width: 100,
                child: Text(
                  "Yes",
                  style: TextStyle(fontSize: 24),
                ),
                alignment: Alignment.center,
              ),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.green[200],
                foregroundColor: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                inputBools.value = [...inputBools.value, false];
                if (inputBools.value.length == 6) {
                  await _controller.register(inputBools.value).then((value) =>
                      context.go("/result",
                          extra: booleans2Personal(inputBools.value)));
                }
              },
              child: Container(
                width: 100,
                child: Text(
                  "No",
                  style: TextStyle(fontSize: 24),
                ),
                alignment: Alignment.center,
              ),
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.red[200],
                foregroundColor: Colors.black,
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ]),
    );
  }
}

final stores = <StoryData>[
  StoryData("友達は多ければ", "多いほどよい"),
  StoryData("遊びに行くときは", "友達を誘う"),
  StoryData("人に合うのは", "面倒だ"),
  StoryData("体を動かすのは", "好きだ"),
  StoryData("行動するときは", "しっかり考えて動く"),
  StoryData("活気のある場所が", "好きだ"),
  StoryData("", "")
];

class StoryData {
  final String first;
  final String second;
  StoryData(this.first, this.second);
}

class PersonalView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PersonalContent(ref.watch(personalControllerProvider));
  }
}
