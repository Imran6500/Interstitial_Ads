import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InterstitialAd? interstitialAd;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Interstitial Ads")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  InterstitialAd.load(
                      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
                      request: const AdRequest(),
                      adLoadCallback:
                          InterstitialAdLoadCallback(onAdLoaded: (ad) {
                        interstitialAd = ad;
                        interstitialAd!.show();
                      }, onAdFailedToLoad: (err) {
                        debugPrint(err.message);
                      }));
                },
                child: const Text("show ads"),
              ),
            ),
          ],
        ));
  }
}
