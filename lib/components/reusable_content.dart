import 'package:flutter/material.dart';
class RecurringContainer extends StatelessWidget {
  RecurringContainer({
    @required this.colour,this.cardChild,this.onPress
  });

  final Color colour;
  final Widget cardChild;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress ,
      child: Container(
        child: cardChild,
        margin:EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color:colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        // width: 170.0,
        //height: 200.0,
      ),
    );
  }
}
