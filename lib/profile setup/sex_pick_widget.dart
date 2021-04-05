import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SexPicker extends StatefulWidget {

  @override
  _SexPickerState createState() => _SexPickerState();
}

class _SexPickerState extends State<SexPicker> {

  int _sexSelected = 0;
  bool _selected = false;
  bool _mSelected = false;
  bool _fSelected = false;

  void checkSelected(int intSelected) {
    if (_sexSelected == 0) {
      _mSelected = true;
      _fSelected = false;
    } else {
      _mSelected = false;
      _fSelected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                _sexSelected = 0;
                checkSelected(_sexSelected);
              });
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _mSelected ? CustomColors.primary : Colors.grey[300],
                  width: 4
                ),
              ),
              child: Center(
                child: Text(
                  'M',
                  style: GoogleFonts.openSans(
                    color: _mSelected ? CustomColors.primary : Colors.grey[300],
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                _sexSelected = 1;
                checkSelected(_sexSelected);
              });
            },
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: _fSelected ? CustomColors.primary : Colors.grey[300],
                  width: 4
                ),
              ),
              child: Center(
                child: Text(
                  'F',
                  style: GoogleFonts.openSans(
                    color: _fSelected ? CustomColors.primary : Colors.grey[300],
                    fontSize: 28,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}