import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerExam extends StatefulWidget {
  const BannerExam({super.key});

  @override
  State<BannerExam> createState() => _BannerExamState();
}

class _BannerExamState extends State<BannerExam> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  final adUnit = Platform.isAndroid
      ? 'ca-app-pub-5536391261194029/8737772706' //기존
      // ? 'ca-app-pub-5536391261194029/1719791993' //신규
      // ? 'ca-app-pub-3940256099942544/6300978111' //테스트 광고
      : 'ca-app-pub-3940256099942544/2934735716';

  void loadAd() {
    _bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnit,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    )..load()
        .onError((error, stackTrace) => debugPrint('$error | $stackTrace'));
  }

  @override
  void initState() {
    super.initState();
    loadAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          if (_isLoaded)
            SizedBox(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                  child: SizedBox(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(
                  ad: _bannerAd!,
                ),
              )),
            )),
        ],
      ),
    );
  }
}
