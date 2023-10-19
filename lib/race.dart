import 'dart:ui';

import 'package:age/ads/native.dart';
import 'package:age/height.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Racee extends StatefulWidget {
  var mtStatuss;
  dynamic newAge;
  Racee(this.mtStatuss, {this.newAge});

  @override
  State<Racee> createState() => _RaceeState();
}

class _RaceeState extends State<Racee> {
  String selectedValue =
      "Any color or shade"; // Initialize with "Any color or shade"
  final MyController myContr = Get.put(MyController());

  @override
  void initState() {
    super.initState();
    myContr.loadAd();
  }

  Widget buildAdWidget() {
    if (myContr.isAdLoaded.value) {
      return NativeAdWidget(myContr.nativeAd!); // Use the custom NativeAdWidget
    } else {
      return const SizedBox(
        height: 0,
      );
    }
  }

  void reloadAd() {
    myContr.reloadAd();
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
                height: 350,
                width: 350,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Race",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RadioListTile(
                        title: Text(
                          "Any color or shade",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: "Any color or shade",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString();
                          });
                        }),
                    //
                    RadioListTile(
                        title: Text("White",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        value: "White",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString();
                          });
                        }),

                    RadioListTile(
                        title: Text(
                          "Black",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: "Black",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString();
                          });
                        }),

                    RadioListTile(
                        title: Text(
                          "Asian",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        value: "Asian",
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString();
                          });
                        }),

                    SizedBox(
                      height: 15,
                    ),

                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HeightFem(
                                        selectedValue,
                                        aVc: widget.mtStatuss,
                                        avd: widget.newAge,
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

                    // Text("Martial Status ${widget.mtStatuss}, ${widget.newAge}")
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  child: Obx(
                    () {
                      return buildAdWidget();
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NativeAdWidget extends StatelessWidget {
  final NativeAd nativeAd;

  NativeAdWidget(this.nativeAd);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Customize the ad container's layout and design as needed
      height: 100,
      child: AdWidget(ad: nativeAd),
    );
  }
}
