import 'dart:io';
import 'dart:ui';

import 'package:age/helper.dart';
import 'package:age/race.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class martialStatus extends StatefulWidget {
  var slectdAge;

  martialStatus(this.slectdAge);

  @override
  State<martialStatus> createState() => _martialStatusState();
}

class _martialStatusState extends State<martialStatus> {
  var selectedValue = "Unmarried"; // Initialize with "Unmarried"
  BannerAd? _banner;
  int? intadValue;
  String? bannerunidId;
  String? iosBannerunidId;
  final CollectionReference _products =
      FirebaseFirestore.instance.collection("products");

  @override
  void initState() {
    super.initState();
    _fetchIntadValue();
  }

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Female Delusion Calculator',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 223, 97, 235),
        ),
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
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Martial Status",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RadioListTile(
                        title: Text(
                          "Unmarried",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: "Unmarried",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString();
                          });
                        }),
                    RadioListTile(
                        title: Text(
                          "Married",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: "Married",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString();
                          });
                        }),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Racee(
                                        selectedValue,
                                        newAge: widget.slectdAge,
                                      )));
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
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
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
