import 'package:flutter/material.dart';
import 'package:flutter_corner_banner/flutter_corner_banner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banner Demo',
      theme: ThemeData.light(),
      home: const DemoView(),
    );
  }
}

class DemoView extends StatelessWidget {
  const DemoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Corner Banner"),
      ),
      body: Center(
        child: BannerWidget(
          showBanner: true,
          bannerPosition: BannerPosition.topRight,
          bannerText: 'Banner',
          bannerSize: 80.0,
          bannerColor: Colors.red,
          child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            width: 200,
            height: 200,
          ),
        ),
      ),
    );
  }
}
