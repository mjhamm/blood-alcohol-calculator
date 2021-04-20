import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BACNotesPage extends StatefulWidget {

  final String title;

  const BACNotesPage({Key key, this.title}) : super(key: key);

  @override
  _BACNotesPageState createState() => _BACNotesPageState();
}

class _BACNotesPageState extends State<BACNotesPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.openSans(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold
          )
        ),
        centerTitle: true,
        elevation: 4.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: BackButton(color: Colors.black,),
      ),
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}