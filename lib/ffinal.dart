import 'dart:ui';

import 'package:age/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Abb extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var dreamsalary;
  dynamic ageSelected;
  dynamic favweight;
  dynamic favcolor;
  dynamic martialstatusselected;
  dynamic favheight;

  Abb(this.dreamsalary,
      {this.ageSelected,
      this.favweight,
      this.favcolor,
      this.martialstatusselected,
      this.favheight});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Female Delusion Calculator',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
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
            Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 20, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color.fromARGB(255, 223, 97, 235).withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    constraints:
                        BoxConstraints.tightForFinite(width: 200, height: 50),
                    child: Center(
                      child: const Text(
                        'My ideal man',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                          // Adjust the font size as needed
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Color.fromARGB(255, 223, 97, 235).withOpacity(0.6),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0)),
                    ),
                    constraints:
                        BoxConstraints.tightForFinite(width: 360, height: 200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age:  $ageSelected",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Martial Status:   $martialstatusselected",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Color:   $favcolor",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Annual income:   $dreamsalary k per year",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Weight:   $favweight lbs (Pounds)",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Height:  $favheight feet tall",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints.tightForFinite(
                            width: 360, height: 340),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Color.fromARGB(255, 223, 97, 235)
                              .withOpacity(0.6),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(0),
                              topLeft: Radius.circular(0),
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            // Text(
                            //   "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //       fontSize: 15, fontWeight: FontWeight.bold),
                            // ),

                            if (ageSelected >= 18 &&
                                ageSelected < 30 &&
                                dreamsalary >= 100 &&
                                dreamsalary < 200)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "3%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            ////////////////////////////////////////
                            if (ageSelected >= 18 &&
                                ageSelected < 30 &&
                                dreamsalary >= 200 &&
                                dreamsalary < 300)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "2.7%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            //////////////////////////////////////////
                            if (ageSelected >= 18 &&
                                ageSelected < 30 &&
                                dreamsalary >= 300 &&
                                dreamsalary < 400)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "2.2%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            ///////////////////////////////
                            if (ageSelected >= 18 &&
                                ageSelected < 30 &&
                                dreamsalary >= 400 &&
                                dreamsalary <= 500)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "2%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            //////////////////////////////////
                            if (ageSelected >= 18 &&
                                ageSelected < 30 &&
                                dreamsalary >= 5 &&
                                dreamsalary <= 99)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "4%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            /////////////////////////////////////////////////////////////////////////////////////
                            if (ageSelected >= 30 &&
                                ageSelected < 50 &&
                                dreamsalary >= 5 &&
                                dreamsalary < 100)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "5%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            //////////////////////////////////
                            if (ageSelected >= 30 &&
                                ageSelected < 50 &&
                                dreamsalary >= 100 &&
                                dreamsalary < 200)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "4.8%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            ////////////////////////////////////
                            if (ageSelected >= 30 &&
                                ageSelected < 50 &&
                                dreamsalary >= 200 &&
                                dreamsalary < 300)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "4.6%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            ///////////////////////////////////
                            if (ageSelected >= 30 &&
                                ageSelected < 50 &&
                                dreamsalary >= 300 &&
                                dreamsalary < 400)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "4.4%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            ///////////////////////////////////
                            if (ageSelected >= 30 &&
                                ageSelected < 50 &&
                                dreamsalary >= 400 &&
                                dreamsalary < 500)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "4.2%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            ////////////////////////////////////////////////////////////////////////////
                            if (ageSelected >= 50 &&
                                ageSelected <= 70 &&
                                dreamsalary >= 5 &&
                                dreamsalary < 100)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "5.6%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            //////////////////////////////////
                            if (ageSelected >= 50 &&
                                ageSelected <= 70 &&
                                dreamsalary >= 100 &&
                                dreamsalary < 200)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "5.5%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            ////////////////////////////////////
                            if (ageSelected >= 50 &&
                                ageSelected <= 70 &&
                                dreamsalary >= 200 &&
                                dreamsalary < 300)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "5.4%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            /////////////////////////////////////
                            if (ageSelected >= 50 &&
                                ageSelected <= 70 &&
                                dreamsalary >= 300 &&
                                dreamsalary < 400)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "5.3%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                            //////////////////////////////////////
                            if (ageSelected >= 50 &&
                                ageSelected <= 70 &&
                                dreamsalary >= 400 &&
                                dreamsalary <= 500)
                              Column(
                                children: [
                                  Text(
                                    "Probability",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      width: 300,
                                      height: 200,
                                      color: Color.fromARGB(255, 187, 81, 81),
                                      child: ProbabilityDots(
                                          probability: 0.07), // Add this line
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "According to data model, the probability a guy of the Pakistan male population ages you want is meets your standards is",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "5.2%",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Expanded(
                    child: Container()), // This will take up remaining space
                Padding(
                  padding:
                      EdgeInsets.only(bottom: 60), // Adjust the value as needed
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp()));
                      },
                      style: ElevatedButton.styleFrom(
                        primary:
                            Color.fromARGB(255, 223, 97, 235).withOpacity(0.6),
                        minimumSize: Size(
                            150, 60), // Adjust the width and height as needed
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Adjust the radius as needed
                        ),
                      ),
                      child: const Text(
                        'New Search',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18, // Adjust the font size as needed
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProbabilityDots extends StatelessWidget {
  final double probability;
  final int totalDots = 600; // You can adjust this number as needed
  final int maxColumns = 30; // Adjust the maximum number of columns
  double dotSize =
      200 / 10; // Calculate the size of the dots based on container width

  ProbabilityDots({required this.probability});

  @override
  Widget build(BuildContext context) {
    int filledDots = (probability * totalDots).round();

    List<bool> dotStates = List.filled(totalDots, false);
    for (int i = 0; i < filledDots; i++) {
      dotStates[i] = true;
    }
    dotStates.shuffle(); // Shuffle the list of dot states/

    int rowCount =
        (totalDots / maxColumns).ceil(); // Calculate the number of rows

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: maxColumns, // Adjust the column count as needed
        mainAxisSpacing: 1, // Adjust the spacing between rows
        crossAxisSpacing: 1, // Adjust the spacing between columns
      ),
      shrinkWrap: true,
      itemCount: totalDots,
      itemBuilder: (context, index) {
        return Container(
          width: dotSize, // Adjust the width of the dots
          height: dotSize, // Adjust the height of the dots
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: dotStates[index]
                ? Color.fromARGB(255, 7, 10, 15) // Black color for filled dots
                : Color.fromARGB(255, 194, 43, 131),
          ),
        );
      },
    );
  }
}
