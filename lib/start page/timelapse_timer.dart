import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeLapseTimer extends StatefulWidget {
  @override
  _TimeLapseTimerState createState() => _TimeLapseTimerState();
}

class _TimeLapseTimerState extends State<TimeLapseTimer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width / 2 - 32,
        height: MediaQuery.of(context).size.width / 2 - 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CustomColors.primary
        ),
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '+',
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Set Limit',
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}