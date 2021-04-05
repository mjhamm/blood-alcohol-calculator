import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:bac_calculator/start%20page/timelapse_sober.dart';
import 'package:bac_calculator/start%20page/timelapse_timer.dart';
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
          bottomNavigationBar: 
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimeLapseSober(),
                  TimeLapseTimer()
                ],
              ),
            ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0, bottom: 8.0, top: 8.0),
                  child: Align(alignment: Alignment.bottomRight, child: 
                    FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: CustomColors.primary,
                      child: Icon(Icons.add, color: Colors.white, size: 28,),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}