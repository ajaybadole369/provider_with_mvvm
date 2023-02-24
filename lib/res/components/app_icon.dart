import 'package:flutter/cupertino.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color? c;
  final double? s;

  const AppIcon({Key? key, required this.icon, this.c, this.s})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: c,
      size: s,
    );
  }
}
