import 'package:intl/intl.dart';

DateTime unixTime2Date(int time) {
  return DateTime.fromMillisecondsSinceEpoch(time * 1000);
}

String unixTime2LongFormat(int time) {
  final date = unixTime2Date(time);

  return DateFormat("yyyy年MM月dd日 hh:mm").format(date).toString();
}

String unixTime2DiffTime(int time) {
  final date = unixTime2Date(time);
  final diff = date.difference(DateTime.now());
  //final weekDay = ['Mon', 'Tue', 'Web', 'Thu', 'Fri', 'Sat', 'Sun'];
  if (diff.inDays < -30) {
    return '${(-1 * diff.inDays / 30).floor()}月前';
  } else if (diff.inDays < 0) {
    return '${-1 * diff.inDays}日前';
  } else if (diff.inHours < 0) {
    return '${-1 * diff.inHours}時間前';
  } else if (diff.inDays < 1) {
    return '${diff.inHours}時間後';
  } else if (diff.inDays < 7) {
    return '${diff.inDays}日後';
  } else {
    return '${(diff.inDays / 30).floor()}月後';
  }
}

bool compareNow(int time) {
  return DateTime.now().microsecondsSinceEpoch / 1000 > time;
}
