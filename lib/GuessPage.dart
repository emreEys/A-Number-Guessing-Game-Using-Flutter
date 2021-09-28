import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Constants.dart';
import 'ResultPage.dart';

class GuessPage extends StatefulWidget {
  const GuessPage({Key? key}) : super(key: key);

  @override
  _GuessPageState createState() => _GuessPageState();
}

class _GuessPageState extends State<GuessPage> {
  var textFieldGuess = TextEditingController();
  int randomNumber = 0;
  int remainingRight = 5;
  String message = "";

  @override
  void initState() {
    super.initState();
    randomNumber = Random().nextInt(20) + 1; //1 - 20;
    print('Random Number: $randomNumber');
  }

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
              Text(
                'Remaining Right: $remainingRight',
                style: GoogleFonts.acme(color: kTextColor, fontSize: 30),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenHeight / 20, horizontal: ScreenWidth / 20),
                child: TextField(
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  maxLength: 2,
                  controller: textFieldGuess,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Your Guess',
                    labelStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    fillColor: Colors.white.withOpacity(.25),
                    filled: true,
                  ),
                ),
              ),
              Text(
                'Help: $message',
                style: GoogleFonts.acme(color: kTextColor, fontSize: 24),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ScreenHeight / 20, horizontal: ScreenWidth / 20),
                child: SizedBox(
                  width: 350,
                  height: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    child: Text(
                      "Guess",
                      style: GoogleFonts.anton(fontSize: 45),
                    ),
                    onPressed: () {
                      setState(() {
                        if (textFieldGuess.text != "") {
                          remainingRight -= 1;
                        }
                      });
                      int guess = int.parse(textFieldGuess.text);
                      if (remainingRight == 0) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(
                              result: false,
                              guessNumber: randomNumber,
                            ),
                          ),
                        );
                      }
                      if (guess == randomNumber) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultPage(result: true),
                          ),
                        );
                      }
                      if (guess > randomNumber) {
                        message = "reduce your guess";
                      }
                      if (guess < randomNumber) {
                        message = "increase your guess";
                      }
                      textFieldGuess.text = "";
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
