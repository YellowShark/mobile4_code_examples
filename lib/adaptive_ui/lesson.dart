import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return const MaterialApp(
          home: HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Adaptive App',
            style: TextStyle(fontSize: 10.sp),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Interesting text',
              style: TextStyle(fontSize: 16.sp),
            ),
            Center(
              child: SizedBox(
                  width: SizerUtil.deviceType == DeviceType.web ? 80.w : 20.w,
                  height: SizerUtil.deviceType == DeviceType.web ? 60.h : 20.h,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'PRESS HERE',
                        style: TextStyle(fontSize: 20.sp),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
