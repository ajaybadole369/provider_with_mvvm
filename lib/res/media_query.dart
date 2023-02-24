import 'package:flutter/cupertino.dart';

class MQ {
  static sB({double? h, double? w}) => SizedBox(height: h, width: w);

  static h({required BuildContext context}) =>
      MediaQuery.of(context).size.height;

  static w({required BuildContext context}) =>
      MediaQuery.of(context).size.width;
}
