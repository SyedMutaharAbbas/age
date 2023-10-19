import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAdController {
  BannerAd? banner;
  int? intadValue;
  String? _bannerAdUnitId;
  String? _iosBannerAdUnitId;

  Future<void> initialize() async {
    await fetchIntadValue();
    if (intadValue == 1) {
      createBannerAd();
    }
  }

  Future<void> fetchIntadValue() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection("products")
          .doc('LFR4ax48biMcaEgN8xRk')
          .get();
      if (doc.exists) {
        intadValue = doc['intad'] as int?;
        _bannerAdUnitId = doc['banner'] as String?;
        _iosBannerAdUnitId = doc['iosbanner'] as String?;
      } else {
        print('Document does not exist');
      }
    } catch (error) {
      print('Error retrieving data from Firebase: $error');
    }
  }

  void createBannerAd() {
    String? adUnitId;

    if (Platform.isAndroid) {
      adUnitId = _bannerAdUnitId;
    } else if (Platform.isIOS) {
      adUnitId = _iosBannerAdUnitId;
    }

    if (adUnitId != null) {
      banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: adUnitId,
        listener: BannerAdListener(
          onAdLoaded: (ad) => print('Banner Ad loaded'),
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print('Banner Ad failed to load: $error');
          },
          onAdOpened: (ad) => print('Banner Ad opened'),
          onAdClosed: (ad) => print('Banner Ad closed'),
        ),
        request: const AdRequest(),
      )..load();
    }
  }

  BannerAd? get bannerAd => banner;
}
