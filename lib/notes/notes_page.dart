import 'package:bac_calculator/bac%20notes%20page/bac_notes_page.dart';
import 'package:bac_calculator/notes/notes_list_tile_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesPage extends StatefulWidget {

  final bool addNote;
  final double currentBAC;

  const NotesPage({Key key, this.currentBAC, this.addNote}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  final List<NotesListTileItem> notesBACNumbers = [
    new NotesListTileItem(0.000),
    new NotesListTileItem(0.001, 0.049),
    new NotesListTileItem(0.050, 0.079),
    new NotesListTileItem(0.080, 0.099),
    new NotesListTileItem(0.100, 0.149),
    new NotesListTileItem(0.150, 0.199),
    new NotesListTileItem(0.200, 0.299),
    new NotesListTileItem(0.300, 0.399),
    new NotesListTileItem(0.400, 0.499),
    new NotesListTileItem(0.500),
  ];

  final AppBar appBar = AppBar(
    title: Text(
      'Notes',
      style: GoogleFonts.openSans(color: Colors.black,)
    ),
    centerTitle: true,
    elevation: 4.0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    leading: BackButton(color: Colors.black,),
  );

  navigateToBAC(String title) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BACNotesPage(title: title,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.addNote ? appBar : null,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0, bottom: 8.0,),
              child: Text(
                'Notes are based on your BAC',
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 3,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context,index) => Divider(
                  height: 2,
                ),
                physics: BouncingScrollPhysics(),
                itemCount: notesBACNumbers.length,
                itemBuilder: (context, index) {
                  switch(index) {
                    case 0:
                      return ListTile(
                        onTap: () {
                          navigateToBAC('BAC is ${notesBACNumbers[index].fromBAC.toStringAsFixed(3)}');
                        },
                        title: Text('BAC is ${notesBACNumbers[index].fromBAC.toStringAsFixed(3)}'),
                        trailing: Icon(Icons.chevron_right, color: Colors.grey[500],),
                      );
                    break;
                    case 9:
                      return ListTile(
                        onTap: () {
                          navigateToBAC('BAC over ${notesBACNumbers[index].fromBAC.toStringAsFixed(3)}');
                        },
                        title: Text('BAC over ${notesBACNumbers[index].fromBAC.toStringAsFixed(3)}'),
                        trailing: Icon(Icons.chevron_right, color: Colors.grey[500],),
                      );
                    break;
                    default:
                      return ListTile(
                        onTap: () {
                          navigateToBAC('BAC is between ${notesBACNumbers[index].fromBAC.toStringAsFixed(3)} to ${notesBACNumbers[index].toBAC.toStringAsFixed(3)}');
                        },
                        title: Text('BAC is between ${notesBACNumbers[index].fromBAC.toStringAsFixed(3)} to ${notesBACNumbers[index].toBAC.toStringAsFixed(3)}'),
                        trailing: Icon(Icons.chevron_right, color: Colors.grey[500],),
                      );
                    break;
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}