import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider_state_mgm/res/components/app_icon.dart';

import '../res/color_picker.dart';

class Utils {
  static flutterToast({required String message}) =>
      Fluttertoast.showToast(msg: message);

  static flushBarErrorMessage(
          {required String message, required BuildContext context}) =>
      showFlushbar(
          context: context,
          flushbar: Flushbar(
            flushbarPosition: FlushbarPosition.BOTTOM,
            icon: const AppIcon(
              icon: Icons.report_gmailerrorred,
              c: ColorPicker.kGameGreen,
            ),
            message: message,
            backgroundColor: ColorPicker.kUltraBlack,
            duration: const Duration(seconds: 3),
          )..show(context));
}
