import 'package:flutter/material.dart';
import 'constants.dart';
class Symbols extends StatelessWidget {
  Symbols({@required this.cardGender,@required this.ttext});
  final IconData cardGender;
  final String ttext;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          //  FontAwesomeIcons.mars,
          cardGender,
          size:80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          //'MALE',
          ttext,
          style:kLabelTextStyle,
        ),

      ],

    );
  }
}