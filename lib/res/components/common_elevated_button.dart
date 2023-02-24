import 'package:flutter/material.dart';

import '../color_picker.dart';
import '../media_query.dart';

class CommonElevatedButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final VoidCallback onPress;

  const CommonElevatedButton(
      {Key? key,
      required this.title,
      this.isLoading = false,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: MQ.w(context: context),
        child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
              backgroundColor: ColorPicker.kUltraBlack,
              foregroundColor: ColorPicker.kGameGreen,
              elevation: 5,
              textStyle: const TextStyle(fontSize: 20)),
          child: isLoading
              ? const CircularProgressIndicator(
                  color: ColorPicker.kGameGreen,
                )
              : Text(title),
        ));
  }
}
