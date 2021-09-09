import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  //const RoundIconButton({Key? key}) : super(key: key);
  RoundIconButton({
    //this.child
    @required this.icon,@required this.onPressed});
  //final  Widget  child;
  final Function onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon,size: 15.0,),
      constraints:  BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onPressed,
      elevation: 3.0,
      shape:CircleBorder(side: BorderSide(color:kActiveCardColor,width: 7.0)),
      fillColor: Color(0xFF4C4F5E),

    );


  }
}

