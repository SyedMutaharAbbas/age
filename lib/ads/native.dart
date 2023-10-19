import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

class MyController extends GetxController {
  NativeAd? _nativeAd;
  RxBool isAdLoaded = false.obs;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection("products");

  Future<void> loadAd() async {
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
            adUnitId = doc['nativeAndroid'] as String?;
          } else if (Platform.isIOS) {
            adUnitId = doc['nativeIos'] as String?;
          } else {
            print('Unsupported platform');
            return;
          }

          if (adUnitId != null) {
            _nativeAd = NativeAd(
              adUnitId: adUnitId,
              listener: NativeAdListener(
                onAdLoaded: (ad) {
                  isAdLoaded.value = true;
                  print('Native Ad Loaded');
                },
                onAdFailedToLoad: (ad, error) {
                  isAdLoaded.value = false;
                  print('Native Ad failed to load: $error');
                },
              ),
              request: AdRequest(),
              nativeTemplateStyle: NativeTemplateStyle(
                templateType: TemplateType.small,
              ),
            );
            _nativeAd!.load();
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

  NativeAd? get nativeAd => _nativeAd;

  void showAd() {
    if (_nativeAd == null) {
      print('Native Ad is null. Trying to load...');
      loadAd();
    } else {
      _nativeAd!.dispose(); // Dispose of the existing ad.
      loadAd(); // Create a new ad instance and load it.
    }
  }

  Future<void> reloadAd() async {
    _nativeAd?.dispose(); // Dispose of the existing ad.
    _nativeAd = null; // Set it to null to ensure it's recreated.
    loadAd(); // Create and load a new ad instance.
  }

  @override
  void dispose() {
    _nativeAd?.dispose();
    super.dispose();
  }
}
