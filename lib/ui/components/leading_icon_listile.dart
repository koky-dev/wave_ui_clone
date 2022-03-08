import 'package:flutter/material.dart';

class LeadingIcon extends StatelessWidget {
  final icon;
  final Color containerColor;
  final Color iconColor;
  const LeadingIcon(
      {Key? key,
      required this.icon,
      required this.iconColor,
      required this.containerColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      //margin: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(50)),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}
