import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Constants.dart';

class ResultPage extends StatefulWidget {
  int? guessNumber;
  bool? result;
  ResultPage({this.result, this.guessNumber});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              widget.result!
                  ? Image.asset('assets/gif/HighFive.gif')
                  : Image.asset('assets/gif/GameOver.gif'),
              Text(
                widget.result!
                    ? 'CORRECT GUESS!!!!! \n CLAP A FIST'
                    : 'SORRY YOU LOST \n\n Right Number: ${widget.guessNumber}',
                textAlign: TextAlign.center,
                style: GoogleFonts.acme(color: kTextColor, fontSize: 40),
              ),
              SizedBox(
                width: 300,
                height: 100,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: kButtonColor),
                  child: Text(
                    "TURN BACK",
                    style: GoogleFonts.anton(fontSize: 45),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
