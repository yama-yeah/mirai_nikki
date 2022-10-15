import 'package:mirai_nikki/domain/model/personal_model.dart';

PersonalModel booleans2Personal(List<bool> list) {
  final counts = [0, 0];
  for (int i = 0; i < boolTypes.length; i++) {
    if (boolTypes[i] && list[i]) {
      counts[0]++;
    } else if (list[i]) {
      counts[1]++;
    }
  }
  return PersonalModel(outdoor: counts[0] > 2, extrovert: counts[1] > 2);
}

const boolTypes = [false, true, false, true, false, true];
//trueがアウトドアかどうかの質問
