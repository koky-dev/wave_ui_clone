import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeComponent extends StatelessWidget {
  const QrCodeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: QrImage(
          data: 'User 1',
          size: 100,
        ),
      ),
    );
  }
}
