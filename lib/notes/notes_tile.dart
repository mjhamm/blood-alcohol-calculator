import 'package:bac_calculator/notes/notes_item.dart';
import 'package:flutter/material.dart';

class NotesTile extends StatefulWidget {

  final NotesItem notesItem;
  final VoidCallback onPress;

  const NotesTile({Key key, this.notesItem, this.onPress}) : super(key: key);
  
  @override
  _NotesTileState createState() => _NotesTileState();
}

class _NotesTileState extends State<NotesTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.notesItem.note),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: widget.onPress,
      ),
    );
  }
}