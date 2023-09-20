import 'dart:ui';

import 'package:age/ads/openad.dart';
import 'package:age/ffinal.dart';
import 'package:age/helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// ignore: must_be_immutable
class Income extends StatefulWidget {
  var rr;
  dynamic tt;
  dynamic yy;
  dynamic uu;
  dynamic ii;
  Income(this.rr, {this.tt, this.yy, this.uu, this.ii});
  @override
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  String selectedIncomeString = '5 k'; // Default selected income
  double selectedIncome = 5.0; // Default selected income value

  RewardedAd? _rewardedAd;
  int _rewardedScore = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _createRewardedAd();
    _showRewardedAd();
    _loadAndShowAd();
  }

  Future<void> _loadAndShowAd() async {
    await ShowAppAd.loadOpenAd();
    ShowAppAd.showAd();
  }

  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: AdHelper.rewardedAdUnitId!,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) => setState(() => _rewardedAd = ad),
        onAdFailedToLoad: (error) => setState(() => _rewardedAd = null),
      ),
    );
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback =
          FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        _createRewardedAd();
      }, onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        _createRewardedAd();
      });
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) => setState(
          () => _rewardedScore++,
        ),
      );
      _rewardedAd = null;
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
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
                child: Container(),
              )),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
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
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Select Income",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          selectedIncomeString,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Slider(
                          value: selectedIncome,
                          min: 5,
                          max: 500,
                          divisions: 99,
                          activeColor: Color.fromARGB(255, 24, 31, 24),
                          inactiveColor: Color.fromARGB(255, 73, 92, 74),
                          label: selectedIncome.round().toString() + ' k',
                          onChanged: (newValue) {
                            setState(() {
                              selectedIncome = newValue;
                              selectedIncomeString = '${newValue.round()} k';
                            });
                          },
                        ),
                        SizedBox(height: 40),

                        ElevatedButton(
                          onPressed: () {
                            _showRewardedAd();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Abb(
                                  selectedIncome,
                                  ageSelected: widget.ii,
                                  favweight: widget.rr,
                                  favcolor: widget.tt,
                                  martialstatusselected: widget.uu,
                                  favheight: widget.yy,
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
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        // Text("${widget.rr}"),
                        // Text("${widget.tt}"),
                        // Text("${widget.yy}"),
                        // Text("${widget.uu}"),
                        // Text("${widget.ii}"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
