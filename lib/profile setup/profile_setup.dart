import 'dart:ui';
import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:bac_calculator/main%20screen/main_screen.dart';
import 'package:bac_calculator/profile%20setup/sex_pick_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileSetup extends StatefulWidget {

  final bool update;

  const ProfileSetup({Key key, this.update}) : super(key: key);

  @override
  _ProfileSetupState createState() => _ProfileSetupState();
}

class _ProfileSetupState extends State<ProfileSetup> {

  AppBar appBar = AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 4.0,
    leading: BackButton(color: Colors.black,),
    title: Text(
      'Profile Setup',
      style: GoogleFonts.openSans(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
    ),
  );

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  void displayToast(String message) {
     final snackBar = SnackBar(content: Text(message), duration: Duration(seconds: 2),);
     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white
      ),
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: widget.update ? null : appBar,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                height: widget.update ? MediaQuery.of(context).size.height - (120) : MediaQuery.of(context).size.height - AppBar().preferredSize.height - MediaQuery.of(context).padding.top,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Please fill out information as accurately as possible for best results.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        )
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          'This information can be changed later.',
                          textAlign: TextAlign.start,
                          style: GoogleFonts.openSans(
                            color: Colors.grey[700],
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 12.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [BoxShadow(
                              color: Colors.grey[400],
                              offset: Offset(2,3),
                              blurRadius: 6
                            )]
                          ),
                          child: Center(
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration.collapsed(
                                border: InputBorder.none,
                                hintText: 'First Name',
                                hintStyle: GoogleFonts.openSans(
                                  color: Colors.grey[500],
                                  fontSize: 16,
                                )
                              ),
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 16
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Please select your sex at birth.',
                          style: GoogleFonts.openSans(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 16.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'This ensures that you receive the most accurate information.',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                              color: Colors.grey[700],
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                      ),
                      SexPicker(),
                      Padding(
                        padding: const EdgeInsets.only(top: 36.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'How old are you?',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 18
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(
                                  color: Colors.grey[400],
                                  offset: Offset(2,3),
                                  blurRadius: 6
                                )]
                              ),
                              child: Center(
                                child: TextField(
                                  controller: ageController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration.collapsed(
                                    hintText: 'Age',
                                    hintStyle: GoogleFonts.openSans(
                                      color: Colors.grey[500],
                                      fontSize: 16,
                                    ),
                                  ),
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 16
                                  ),
                                ),
                              ),
                            ),
                            ],
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 36.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'How much do you weigh?',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 18
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(
                                  color: Colors.grey[400],
                                  offset: Offset(2,3),
                                  blurRadius: 6
                                )]
                              ),
                              child: Center(
                                child: TextField(
                                  controller: weightController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration.collapsed(
                                    hintText: 'Weight',
                                    hintStyle: GoogleFonts.openSans(
                                      color: Colors.grey[500],
                                      fontSize: 16
                                    ),
                                  ),
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 16
                                  ),
                                ),
                              ),
                            ),
                            ],
                          ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 36.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'How tall are you? (inches)',
                              style: GoogleFonts.openSans(
                                color: Colors.black,
                                fontSize: 18
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [BoxShadow(
                                  color: Colors.grey[400],
                                  offset: Offset(2,3),
                                  blurRadius: 6
                                )]
                              ),
                              child: Center(
                                child: TextField(
                                  controller: heightController,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration.collapsed(
                                    hintText: 'Height',
                                    hintStyle: GoogleFonts.openSans(
                                      color: Colors.grey[500],
                                      fontSize: 16
                                    ),
                                  ),
                                  style: GoogleFonts.openSans(
                                    color: Colors.black,
                                    fontSize: 16
                                  ),
                                ),
                              ),
                            ),
                            ],
                          ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(width: 250, height: 40),
                          child: ElevatedButton(
                            onPressed: () {
                              if (widget.update) {
                                displayToast('Profile Updated.');
                              } else {
                                displayToast('Profile Created.');
                              }
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => MainScreen()),
                                (Route<dynamic> route) => false,
                              );
                              // if (nameController.text.isEmpty) {
                              //   displayToast('Please enter your name.');
                              // } else {
                              //   if (ageController.text.isEmpty) {
                              //     displayToast('Please enter your age.');
                              //   } else {
                              //     if (weightController.text.isEmpty) {
                              //       displayToast('Please enter your weight.');
                              //     } else {
                              //       if (heightController.text.isEmpty) {
                              //         displayToast('Please enter your height.');
                              //       }
                              //       else {
                              //         Navigator.of(context).push(MaterialPageRoute(builder: (context) => StartPage()));
                              //       }
                              //     }
                              //   }
                              // }
                            },
                            child: Text(
                              widget.update ? 'Update Profile' : 'Create Profile',
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: CustomColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}