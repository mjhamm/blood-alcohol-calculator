import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:bac_calculator/start%20page/timelapse_sober.dart';
import 'package:bac_calculator/start%20page/timelapse_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: CustomColors.primary
      ),
      child: SafeArea(
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
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [

                    ],
                  ),
                ),
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
              ]
            ),
        ),
      ),
    );
  }
}