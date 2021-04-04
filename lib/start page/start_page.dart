import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatelessWidget {

  final Widget appBar = AppBar(
    backgroundColor: CustomColors.primary,
    centerTitle: true,
    title: Text(
      'BAC Calculator',
      style: GoogleFonts.openSans(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
    ),
    leading: Container(),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
          onPressed: () {},
          icon: Icon(CupertinoIcons.person_circle, color: Colors.white, size: 34,),
          splashRadius: 28,
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: CustomColors.primary
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: appBar,
          body: Container(
            
          ),
        ),
      ),
    );
  }
}