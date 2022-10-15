import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:mirai_nikki/domain/util/date_util.dart';

void main() {
  test("", () {
    Logger().d(unixTime2Date(1665812810));
    Logger().d(unixTime2DiffTime(1665812810));
  });
}
