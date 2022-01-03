import 'package:flutter/material.dart';

class PerksTile extends StatelessWidget {

  final String firstLine;
  final String secondLine;
  final IconData displayIcon;

  const PerksTile({Key key, @required this.displayIcon, @required this.firstLine, @required this.secondLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(displayIcon, color: Colors.grey,),
        SizedBox(height: 6,),
        Text(firstLine, style: TextStyle(fontFamily: 'Ub', color: Colors.grey),),
        Text(secondLine, style: TextStyle(fontFamily: 'Ub', color: Colors.grey),),
      ],
    );
  }
}
