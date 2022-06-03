import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _loadedData = false;

  @override
  Widget build(BuildContext context) {
    _simulateNetworkRequest();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 1000),
            opacity: _loadedData ? 0 : 1,
            child: Lottie.asset('assets/animations/love_you.json'),
            onEnd: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
        ],
      ),
    );
  }

  Future<void> _simulateNetworkRequest() async {
    Future.delayed(const Duration(seconds: 2), () async {
      setState(() => _loadedData = true);
    });
  }
}
