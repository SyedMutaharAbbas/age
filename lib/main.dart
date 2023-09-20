import 'dart:ui';

import 'package:age/martialStatus.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Female Delusion Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

///////////////////
class _MyHomePageState extends State<MyHomePage> {
  double selectedAge = 18.0;

  @override
  Widget build(BuildContext context) {
    var slectdAge = selectedAge;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Female Delusion Calculator',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 223, 97, 235),
        ),
        body: Stack(
          fit: StackFit.expand,

          ///
          children: [
            ////////////
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
                      'Age Selection',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      selectedAge.toString() + " years",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Slider(
                      value: selectedAge,
                      min: 18,
                      max: 70,
                      divisions: 52,
                      activeColor: Color.fromARGB(255, 24, 31, 24),
                      inactiveColor: Color.fromARGB(255, 73, 92, 74),
                      label: selectedAge.round().toString(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedAge = newValue;
                        });
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                martialStatus(slectdAge.toInt()),
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
                            fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
