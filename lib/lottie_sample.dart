import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieSample extends StatelessWidget {
  const LottieSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset('assets/animations/love_you.json'),
        ],
      ),
    );
  }
}
