import 'dart:io';
import 'dart:ui';

import 'package:age/weight.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// ignore: must_be_immutable
class HeightFem extends StatefulWidget {
  var faceColor;
  dynamic aVc;
  dynamic avd;
  HeightFem(this.faceColor, {this.aVc, this.avd});

  @override
  State<HeightFem> createState() => _HeightFemState();
}

class _HeightFemState extends State<HeightFem> {
  double selectedHeight = 4.0;

  late InterstitialAd _interstitialAd;
  String? unitIdFinal;

  final CollectionReference _products =
      FirebaseFirestore.instance.collection("products");

  BannerAd? _banner;
  int? intadValue;
  String? bannerunidId;
  String? iosBannerunidId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createInterstitialAd();
    _showInterstitialAd();
    _fetchIntadValue();
  }

  ///////////////////////////////bannner ad////////////////
  Future<void> _fetchIntadValue() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection("products")
          .doc('LFR4ax48biMcaEgN8xRk')
          .get();
      if (doc.exists) {
        final intad = doc['intad'];
        final banner = doc['banner'] as String;
        final iosBanner = doc['iosbanner'] as String; // Get the iOS ad unit ID
        setState(() {
          intadValue = intad;
          bannerunidId = banner;
          iosBannerunidId = iosBanner; // Assign the iOS ad unit ID
        });
        if (intadValue == 1) {
          _createBannerAd();
        }
      } else {
        print('Document does not exist');
      }
    } catch (error) {
      print('Error retrieving data from Firebase: $error');
    }
  }

  void _createBannerAd() {
    String? adUnitId;

    // Check the current platform and choose the appropriate ad unit ID
    if (Platform.isAndroid) {
      adUnitId = bannerunidId;
    } else if (Platform.isIOS) {
      adUnitId = iosBannerunidId;
    } else {
      // Handle other platforms if needed
      adUnitId =
          null; // Set to null or handle differently as per your requirement
    }

    if (adUnitId != null) {
      _banner = BannerAd(
        size: AdSize.fullBanner,
        adUnitId: adUnitId,
        listener: BannerAdListener(
          onAdLoaded: (ad) => debugPrint('ad loaded'),
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            debugPrint("Ad failed to load : $error");
          },
          onAdOpened: (ad) => debugPrint("Ad opened"),
          onAdClosed: (ad) => debugPrint("Ad closed"),
        ),
        request: const AdRequest(),
      )..load();
    }
  }

  ///////////////////////////////////////////////////////////////

  void _createInterstitialAd() async {
    try {
      final doc = await FirebaseFirestore.instance
          .collection("products")
          .doc('LFR4ax48biMcaEgN8xRk')
          .get();
      if (doc.exists) {
        final unitId = doc['androidInterstatile'] as String?;
        final iosInterstitial = doc['IosInterstatile'] as String;

        if (Platform.isAndroid) {
          unitIdFinal = unitId;
        } else if (Platform.isIOS) {
          unitIdFinal = iosInterstitial;
        } else {
          // Handle other platforms if needed
          unitIdFinal =
              null; // Set to null or handle differently as per your requirement
        }
        if (unitIdFinal != null) {
          InterstitialAd.load(
            adUnitId: unitIdFinal!,
            request: const AdRequest(),
            adLoadCallback: InterstitialAdLoadCallback(
              onAdLoaded: (ad) => _interstitialAd = ad,
              onAdFailedToLoad: (LoadAdError error) =>
                  print("Error loading ad: $error"),
            ),
          );
        } else {
          print('unitId is null or not found in Firestore');
        }
      } else {
        print('Document does not exist');
      }
    } catch (error) {
      print('Error retrieving data from Firebase: $error');
    }
  }

  void _showInterstitialAd() {
    // Fetch the value of 'intad' from Firebase Firestore
    _products.doc('LFR4ax48biMcaEgN8xRk').get().then((doc) {
      if (doc.exists) {
        final intadValue = doc['intad'];

        // Check if 'intad' is equal to 1
        if (intadValue == 1) {
          if (_interstitialAd != null) {
            _interstitialAd!.fullScreenContentCallback =
                FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _createInterstitialAd();
            }, onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              _createInterstitialAd();
            });
            _interstitialAd!.show();
          }
        }
      } else {
        print('Document does not exist');
      }
    }).catchError((error) {
      print('Error retrieving data from Firebase: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //backgroundColor: Colors.pink,
        appBar: AppBar(
          title: Text(
            'Female Delusion Calculator',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 223, 97, 235),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/fem.jpg',
              fit: BoxFit.cover,
            ),
            Positioned.fill(
                child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
              child: Container(
                color: Colors.transparent,
              ),
            )),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Color.fromARGB(255, 223, 97, 235).withOpacity(0.6),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(15)),
                ),
                height: 300,
                width: 360,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select Height',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      selectedHeight.toString() + " feet",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Slider(
                      value: selectedHeight,
                      min: 4.0,
                      max: 7.0,
                      divisions: 30,
                      activeColor: Color.fromARGB(255, 24, 31, 24),
                      inactiveColor: Color.fromARGB(255, 73, 92, 74),
                      label: selectedHeight.round().toString() + ' feet',
                      onChanged: (newValue) {
                        setState(() {
                          selectedHeight = newValue;
                        });
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showInterstitialAd();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WeightSel(
                              selectedHeight,
                              qq: widget.aVc,
                              ww: widget.avd,
                              ee: widget.faceColor,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(221, 255, 255, 255),
                        minimumSize: Size(130, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              7), // Adjust the radius as needed
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: intadValue == 1 ? _buildBannerAd() : null,
      ),
    );
  }

  Widget _buildBannerAd() {
    return Container(
      height: 52,
      margin: const EdgeInsets.only(top: 12),
      child: AdWidget(ad: _banner!),
    );
  }
}
