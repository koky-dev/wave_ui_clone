import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({Key? key}) : super(key: key);

  @override
  _LockScreenState createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  //bool canCheckBiometrics = await LocalAuthentication()
  final LocalAuthentication _auth = LocalAuthentication();
  late List<BiometricType> _availableBiometrics;
  late bool canCheckBiometrics;

  Future<void> canCheckBiometric() async {
    bool canCheck;
    //bool check;
    try {
      canCheck = await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    if (!mounted) return;

    setState(() {
      canCheckBiometrics = true;
    });
  }

  Future<void> getAvailableBiometrics() async {
    try {} on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Welcome Screen'),
          ElevatedButton(
            child: const Text('Can check or not biometrics'),
            onPressed: canCheckBiometric,
          ),
          ElevatedButton(
            child: Text('Can check or not biometrics'),
            onPressed: canCheckBiometric,
          ),
          //Text(_availableBiometrics),
          // ElevatedButton(
          //   child: Text('Can check or not biometrics'),
          //   onPressed: canCheckBiometric,
          // ),
        ],
      ),
    ));
  }
}
