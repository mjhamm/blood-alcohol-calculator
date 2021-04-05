import 'package:bac_calculator/colors/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheetHelp extends StatelessWidget {

  final String itemName;

  const BottomSheetHelp({Key key, this.itemName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: CupertinoActionSheet(
        title: 
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  width: 40,
                  height: 5,
                ),
              ),
              Text(
                'Help',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Call Uber',
              style: TextStyle(
                color: Colors.blue
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Call Taxi',
              style: TextStyle(
                color: Colors.blue
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Check MBTA Schedule',
              style: TextStyle(
                color: Colors.blue
              ),
            ),
          )
        ],
        cancelButton: TextButton(
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Colors.red
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}