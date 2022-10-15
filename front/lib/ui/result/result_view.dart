import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mirai_nikki/domain/const/const.dart';
import 'package:mirai_nikki/domain/model/personal_model.dart';

class ResultView extends HookConsumerWidget {
  final PersonalModel _model;
  ResultView(this._model);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = 0;
    if (_model.outdoor && _model.extrovert) {
      index = 3;
    } else if (_model.outdoor && !_model.extrovert) {
      index = 2;
    } else if (!_model.outdoor && !_model.extrovert) {
      index = 1;
    } else {
      index = 0;
    }
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Container(),
          Text(
            messages[index].first,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
          Text(
            messages[index].second,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
          Spacer(
            flex: 2,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.lightBlueAccent,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                context.go("/");
              },
              child: Text(
                "OK",
                style: TextStyle(fontSize: 20),
              )),
          Spacer(),
        ],
      ),
    );
  }
}
