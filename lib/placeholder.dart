import 'package:flutter/material.dart';

class Placeholder extends StatelessWidget {

  final color;

  const Placeholder({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: color,
    );
  }
}