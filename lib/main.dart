import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'GuessPage.dart';
import 'constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData Screen = MediaQuery.of(context);
    final double ScreenHeight = Screen.size.height;
    final double ScreenWidth = Screen.size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenHeight / 20, horizontal: ScreenWidth / 20),
                child: Text(
                  'Number Guessing Game',
                  style: GoogleFonts.acme(color: kTextColor, fontSize: 30),
                ),
              ),
              Text(
                'Good Luck',
                style: GoogleFonts.pacifico(color: kTextColor, fontSize: 25),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenHeight / 20, horizontal: ScreenWidth / 20),
                child: Image.asset('assets/images/dice.jpeg'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenHeight / 20, horizontal: ScreenWidth / 20),
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kButtonColor),
                    child: Text(
                      "Let's Start",
                      style: GoogleFonts.anton(fontSize: 45),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GuessPage()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
