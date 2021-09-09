import 'package:bmi_calculator/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/reusable_content.dart';
//import 'input_page.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
class ResultsPage extends StatelessWidget {
  ResultsPage({@required this.bmiResults,@required this.bmiText,@required this.bmiAdvice});

  final String bmiResults;
  final String bmiText;
  final String bmiAdvice;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('BMI CALCULATOR'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(

            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result",
              style: kTitleTextStyle,),
            ),
          ),
          Expanded(
              flex:5,
              child: RecurringContainer(colour: kActiveCardColor,cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(bmiText.toUpperCase(),style: kResultTextStyle,),
                Text(bmiResults,style:kBMITextStyle),
                Text(bmiAdvice,
                    textAlign: TextAlign.center,
                    style:kBodyTextStyle),

              ],
              ),
              ),
          ),
          BottomButton(onTap:(){
            Navigator.pop(context);
          }, buttonTitle: 'RECALCULATE'),
        ],
      ),

    );
  }
}
