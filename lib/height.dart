import 'dart:ui';

import 'package:age/helper.dart';
import 'package:age/weight.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createInterstitialAd();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      adUnitId: AdHelper.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => _interstitialAd = ad,
        onAdFailedToLoad: (LoadAdError error) => print("error ads"),
      ),
    );
  }

  void _showInterstitialAd() {
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

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _createInterstitialAd();
//   }

//   void _createInterstitialAd() {
//     InterstitialAd.load(
//       adUnitId: AdHelper.interstitialAdUnitId,
//       request: const AdRequest(),
//       adLoadCallback: InterstitialAdLoadCallback(
//         onAdLoaded: (ad) => _interstitialAd = ad,
//         onAdFailedToLoad: (LoadAdError error) => print("error ads"),
//       ),
//     );
//   }

//   void _showInterstitialAd() {
//     if (_interstitialAd != null) {
//       _interstitialAd!.fullScreenContentCallback =
//           FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
//         ad.dispose();
//         _createInterstitialAd();
//       }, onAdFailedToShowFullScreenContent: (ad, error) {
//         ad.dispose();
//         _createInterstitialAd();
//       });
//       _interstitialAd!.show();
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          //backgroundColor: Colors.pink,
          appBar: AppBar(
            title: Text(
              'Female Delusion Calculator',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        selectedHeight.toString() + " feet",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
          )),
    );
  }
}
