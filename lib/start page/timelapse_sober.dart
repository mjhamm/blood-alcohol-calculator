import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeLapseSober extends StatefulWidget {
  @override
  _TimeLapseSoberState createState() => _TimeLapseSoberState();
}

class _TimeLapseSoberState extends State<TimeLapseSober> {
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
          color: CustomColors.liberty
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
                '0:00',
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                'Until Sober',
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}