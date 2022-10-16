import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:mirai_nikki/domain/model/post_model.dart';
import 'package:mirai_nikki/domain/util/date_util.dart';
import 'package:mirai_nikki/ui/widget/main_divider.dart';

class DiaryFragment extends StatelessWidget {
  final PostModel _model;
  final Function(Uint8List bytes, PostModel post) uploadImage;
  const DiaryFragment(this._model, {super.key, required this.uploadImage});

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
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
                color: !compareNow(_model.deadline) ? Colors.red : Colors.black,
              ),
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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(_model.image),
                  /*Image.network(
                    _model.image,
                    fit: BoxFit.fitHeight,
                  ).image*/
                  fit: BoxFit.cover,
                ),
              ),
              height: 50,
              width: 100,
              child: !compareNow(_model.deadline)
                  ? const Center(
                      child: Text(
                        "この思い出は存在しません",
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                    )
                  : _model.image !=
                          "https://firebasestorage.googleapis.com/v0/b/yogen-nikki.appspot.com/o/glitch-white-animation.gif?alt=media&token=5de1cffa-75b6-43d4-aa3e-b6c5c5762dcd"
                      ? null
                      : ElevatedButton(
                          onPressed: () async {
                            try {
                              final XFile? photo = await _picker.pickImage(
                                  source: ImageSource.camera);

                              final bytes = await photo?.readAsBytes();
                              List<int> bodyBytes = [];
                              if (bytes == null) {
                                return;
                              }
                              await uploadImage(bytes, _model);
                              Logger().d(bodyBytes);
                            } catch (e) {}
                          },
                          style: ElevatedButton.styleFrom(
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              alignment: Alignment.center),
                          child: Container(
                            child: Row(children: const [
                              Icon(Icons.camera_alt_sharp),
                              Text("写真を撮影する"),
                            ]),
                          ),
                        ),
            ),
          ),
        ),
      ],
    );
  }
}
