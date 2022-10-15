import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/domain/util/date_util.dart';
import 'package:mirai_nikki/ui/widget/main_divider.dart';

class DiaryFragment extends StatelessWidget {
  final PostModel _model;
  const DiaryFragment(this._model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        mainDivider,
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              unixTime2DiffTime(_model.deadline),
              textAlign: TextAlign.left,
              style: TextStyle(
                  color:
                      compareNow(_model.deadline) ? Colors.black : Colors.red),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              _model.title,
              style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey,
            ),
            //image
            height: 120,

            width: MediaQuery.of(context).size.width,
            child: SizedBox(
              height: 50,
              width: 100,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.blueGrey,
                    alignment: Alignment.center),
                child: Container(
                  child: compareNow(_model.deadline)
                      ? Row(children: [
                          Icon(Icons.camera_alt_sharp),
                          Text("写真を撮影する"),
                        ])
                      : Text("この思い出は存在しません"),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
