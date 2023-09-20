import 'dart:ui';

import 'package:age/income.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WeightSel extends StatefulWidget {
  var newHeight;
  dynamic qq;
  dynamic ww;
  dynamic ee;
  WeightSel(this.newHeight, {this.ww, this.qq, this.ee});
  @override
  _WeightSelState createState() => _WeightSelState();
}

class _WeightSelState extends State<WeightSel> {
  String selectedWeightString = '160 lbs'; // Default selected weight
  double selectedWeight = 160; // Default selected weight value

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
                child: Container(
                  color: Colors.transparent,
                ),
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
                          "Select Weight",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          selectedWeightString,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Slider(
                          value: selectedWeight,
                          min: 110,
                          max: 256,
                          divisions: 146,
                          activeColor: Color.fromARGB(255, 24, 31, 24),
                          inactiveColor: Color.fromARGB(255, 73, 92, 74),
                          label: selectedWeight.round().toString() + ' lbs',
                          onChanged: (newValue) {
                            setState(() {
                              selectedWeight = newValue;
                              selectedWeightString = '${newValue.round()} lbs';
                            });
                          },
                        ),
                        SizedBox(height: 50),

                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Income(
                                  selectedWeight,
                                  tt: widget.ee,
                                  yy: widget.newHeight,
                                  uu: widget.qq,
                                  ii: widget.ww,
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
                                color: Colors.black),
                          ),
                        ),
                        // Text("${widget.newHeight}"),
                        // Text("${widget.qq}"),
                        // Text("${widget.ww}"),
                        // Text("${widget.ee}"),
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
