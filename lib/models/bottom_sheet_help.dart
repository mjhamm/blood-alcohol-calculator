import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomSheetHelp extends StatelessWidget {

  final String itemName;

  const BottomSheetHelp({Key key, this.itemName}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Future<void> _openCallTaxi(String url) async {
    //   if (await canLaunch(url)) {
    //     await launch(url);
    //   } else {
    //     throw 'Could not launch $url';
    //   }
    // }

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
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Call Uber',
              style: TextStyle(
                color: Colors.blue
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              launch('tel:17819742408');
              Navigator.pop(context);
            },
            child: Text(
              'Call Taxi',
              style: TextStyle(
                color: Colors.blue
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
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