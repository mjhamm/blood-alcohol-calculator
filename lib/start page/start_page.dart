import 'dart:ui';

import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:bac_calculator/start%20page/timelapse_sober.dart';
import 'package:bac_calculator/start%20page/timelapse_timer.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class StartPage extends StatefulWidget {

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _animationController;

  bool _addClicked = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 260),
    );
    final curvedAnimation = CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final floatingActionBubble = FloatingActionBubble(
      backGroundColor: CustomColors.primary,
      items: [
        Bubble(
          title: 'Add a Drink',
          iconColor: Colors.white,
          bubbleColor: CustomColors.primary,
          icon: Icons.local_drink_rounded,
          titleStyle: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 16
          ),
          onPress: () {
            setState(() {
              _addClicked = false;
            });
            _animationController.reverse();
          }
        ),
        Bubble(
          title: 'Add Food',
          iconColor: Colors.white,
          bubbleColor: CustomColors.primary,
          icon: Icons.fastfood,
          titleStyle: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 16
          ),
          onPress: () {
            setState(() {
              _addClicked = false;
            });
            _animationController.reverse();
          }
        ),
        Bubble(
          title: 'Add a Note',
          iconColor: Colors.white,
          bubbleColor: CustomColors.primary,
          icon: Icons.notes,
          titleStyle: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 16
          ),
          onPress: () {
            setState(() {
              _addClicked = false;
            });
            _animationController.reverse();
          }
        ),
      ],
      // animation controller
      animation: _animation,

        // On pressed change animation state
      onPress: () {
        setState(() {
          if (_animationController.isCompleted) {
          _addClicked = false;
          _animationController.reverse();
        } else {
          _addClicked = true;
          _animationController.forward();
        }
        });
        
      },

        // Floating Action button Icon color
      iconColor: Colors.white,
      iconData: Icons.add_rounded,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: CustomColors.primary
      ),
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            if (_addClicked) {
              setState(() {
              _addClicked = false;
            });
            _animationController.reverse();
            }
          },
          child: Scaffold(
            bottomNavigationBar:
              Container(
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TimeLapseTimer(),
                    TimeLapseSober(),
                  ],
                ),
              ),
              body: Stack(
                children: [ 
                  Container(
                    padding: EdgeInsets.only(top: 12),
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 7,
                                child: Container(
                                  padding: EdgeInsets.only(right: 8),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Current BAC',
                                        style: GoogleFonts.openSans(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        '0.00',
                                        style: GoogleFonts.openSans(
                                          color: CustomColors.primary,
                                          fontSize: 56,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        'You are feeling relaxed, talkative, and mildly euphoric. Your inhibitions are lowered and your reasoning and memory are impaired slightly. Your coordination may be mildly impaired.',
                                        style: GoogleFonts.openSans(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Duration',
                                        style: GoogleFonts.openSans(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Text(
                                        '20 minutes',
                                        style: GoogleFonts.openSans(
                                          color: CustomColors.primary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          'Total Drinks',
                                          style: GoogleFonts.openSans(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '4',
                                        style: GoogleFonts.openSans(
                                          color: CustomColors.primary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),
                                      SizedBox(
                                        height: 24,
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: ElevatedButton(
                                          onPressed: _addClicked ? null : () {},
                                          child: Text(
                                            'Reset',
                                            style: GoogleFonts.openSans(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500
                                            ),
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                                              (Set<MaterialState> states) {
                                                if (states.contains(MaterialState.pressed)) {
                                                  return CustomColors.primary;
                                                }
                                                else if (states.contains(MaterialState.disabled)) {
                                                  return CustomColors.primary;
                                                }
                                                return CustomColors.primary;
                                              }
                                            ),
                                            elevation: MaterialStateProperty.all(4),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20)
                                              )
                                            )
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0, bottom: 16.0, top: 8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: _addClicked ? BackdropFilter(child: floatingActionBubble, filter: ImageFilter.blur(sigmaY: 6, sigmaX: 6),) : floatingActionBubble
                    ),
                  ),
                ]
              ),
          ),
        ),
      ),
    );
  }
}