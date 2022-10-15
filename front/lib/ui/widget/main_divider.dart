import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';

const mainDivider = Padding(
  padding: EdgeInsets.only(left: 4),
  child: DottedLine(
    dashRadius: 3,
    dashLength: 10,
    lineThickness: 4,
  ),
);
