import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ShowAppAd {
  static AppOpenAd? _appOpenAd;

  final CollectionReference _products =
      FirebaseFirestore.instance.collection("products");

  static Future<void> loadOpenAd() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection("products")
          .doc('LFR4ax48biMcaEgN8xRk')
          .get();
      if (doc.exists) {
        final int? intad = doc['intad'] as int?;
        final String? adUnitId;

        if (intad == 1) {
          // Check the platform (Android or iOS) and select the appropriate adUnitId
          if (Platform.isAndroid) {
            adUnitId = doc['openAd'] as String?;
          } else if (Platform.isIOS) {
            adUnitId = doc['iosOpen'] as String?;
          } else {
            print('Unsupported platform');
            return;
          }

          if (adUnitId != null) {
            await AppOpenAd.load(
              adUnitId: adUnitId,
              orientation: AppOpenAd.orientationPortrait,
              adLoadCallback: AppOpenAdLoadCallback(
                onAdLoaded: (ad) {
                  _appOpenAd = ad;
                  // _appOpenAd!.show();
                },
                onAdFailedToLoad: (error) {
                  print('AppOpenAd failed to load: $error');
                  // Handle the error.
                },
              ),
              request: AdRequest(),
            );
          } else {
            print('adUnitId is null or not found in Firestore');
          }
        } else {
          print('intad is not equal to 1');
        }
      } else {
        print('Document does not exist');
      }
    } catch (error) {
      print('Error retrieving data from Firebase: $error');
    }
  }

  static void showAd() {
    if (_appOpenAd == null) {
      print("TRYING TO SHOW AD");
      loadOpenAd();
      return;
    }
    _appOpenAd!.fullScreenContentCallback =
        FullScreenContentCallback(onAdShowedFullScreenContent: (ad) {
      print('onAdShowedFullScreenContent');
    }, onAdFailedToShowFullScreenContent: (ad, error) {
      print("DISPOSE AD");
      ad.dispose();
      _appOpenAd = null;
      loadOpenAd();
    }, onAdDismissedFullScreenContent: (ad) {
      print("onAdDismissedFullScreenContent AD");
      ad.dispose();
      _appOpenAd = null;
      loadOpenAd();
    });
    _appOpenAd!.show();
  }
}
