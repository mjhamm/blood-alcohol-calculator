import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:bac_calculator/main%20screen/main_screen.dart';
import 'package:bac_calculator/profile%20setup/profile_setup.dart';
import 'package:bac_calculator/start%20page/start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class DisclaimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget appBar = AppBar(
      backgroundColor: CustomColors.primary,
      centerTitle: true,
      title: Text(
        'Disclaimer',
        style: GoogleFonts.openSans(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
    );
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: CustomColors.primary
      ),
      child: SafeArea(
        child: Scaffold(
          appBar: appBar,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'This is not intended as a scientific tool for measuring Blood Alcohol Concentration (BAC), but it is rather '
                        'designed to help adults of legal drinking age understand the factors that affect their BAC. The information '
                        'presented should not take the place of your own responsible decisions about drinking alcohol, or about whether '
                        'and when it will be safe to drive. The effects of alcohol vary among individuals because of many factors and '
                        'may be different for the same person at different times. The BACs shown are solely for illustrative purposes, '
                        'and do not reflect the interaction of alcohol with prescription, over-the-counter or illegal drugs. Mixing '
                        'any drugs with alcohol can be dangerous to you and to others. 21 is the legal drinking age in the United States.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      'Food',
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Divider(
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 250, height: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileSetup(update: false,)));
                        },
                        child: Text(
                          'I Agree',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 18
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: CustomColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}