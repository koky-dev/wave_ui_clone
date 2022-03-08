import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wave_ui_clone/ui/screens/lock_screen.dart';

class SplashScreenTimer extends StatelessWidget {
  const SplashScreenTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LockScreen())));
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/logo.png'),
        ),
      ),
    );
  }
}
