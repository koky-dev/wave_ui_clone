import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String text;
  final icon;
  final Color color;
  const CardButton(
      {Key? key, required this.text, required this.icon, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      width: MediaQuery.of(context).size.width * 0.3,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: color,
                size: 50,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                text,
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
