import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reusable_content.dart';
import '../components/icon_content.dart';
import '../components/constants.dart';
import 'result_page.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/RoundButton.dart';
import 'package:bmi_calculator/components/functionality.dart';
enum Gender{male,female}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
 Gender selectedGender;
int height=180;
int weight=50;
int age=18;

 // Color maleCardColor =inactiveCardColor;
 // Color femaleCardColor = inactiveCardColor;

 //1=male,2=female
 // void updateColor(Gender sGender) {
 //   maleCardColor=maleCardColor==inactiveCardColor?activeCardColor:inactiveCardColor;
 //   femaleCardColor=maleCardColor==inactiveCardColor?activeCardColor:inactiveCardColor;
 //   if (sGender==Gender.male) {
 //     if (maleCardColor == inactiveCardColor) {
 //       maleCardColor = activeCardColor;
 //       femaleCardColor=inactiveCardColor;
 //     }
 //     else {
 //       maleCardColor=inactiveCardColor;
 //     }
 //   }
 //   if(sGender==Gender.female){
 //     if (femaleCardColor == inactiveCardColor) {
 //       femaleCardColor =  activeCardColor;
 //       maleCardColor=inactiveCardColor;
 //     }
 //     else {
 //       femaleCardColor=activeCardColor;
 //     }
 //   }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        children: [
          Expanded(
            child:Row(
             children: [Expanded(
                child:RecurringContainer(
                  onPress: (){
                    setState(() {
                      selectedGender=Gender.male;
                    });
                  },
                  colour:selectedGender==Gender.male?kActiveCardColor:kInactiveCardColor,
                  cardChild:Symbols(cardGender:FontAwesomeIcons.mars,ttext: 'MALE'),
                ),
              ),
               Expanded(
                 child:RecurringContainer(
                   onPress: (){
                     setState(() {
                       selectedGender=Gender.female;
                     });
                   },
                     colour:selectedGender==Gender.female?kActiveCardColor:kInactiveCardColor,
               cardChild:Symbols(cardGender:FontAwesomeIcons.venus,ttext: 'FEMALE'),
                 ),
               ),
            ],
          ),
          ),
          Expanded(
            child:Row(
              children: [Expanded(
                child:RecurringContainer(colour:kActiveCardColor,
                cardChild: Column(
                 //crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("HEIGHT",
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style:kNumberStyle,
                        ),
                        Text('cm',
                        style: kLabelTextStyle,
                        ),

                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29E81555),
                        thumbColor: Color(0xFFEB1555),
                        inactiveTrackColor: Color(0xFF8D8E98) ,
                        activeTrackColor: Colors.white,
                      ),
                      child: Slider(
                        value:height.toDouble() ,
                        min: 120.0,
                        max: 220.0,
                      //  activeColor:Colors.white ,
                     //   inactiveColor: Color(0xFF8D8E98),
                        onChanged:(double newValue){
                          // print(newValue);
                          setState(() {
                            height=newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                ),
                ),
              ),

              ],
            ),
          ),
          Expanded(
            child:Row(
              children: [
                Expanded(
                child:RecurringContainer(colour:kActiveCardColor,
                cardChild:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("WEIGHT",
                    style: kLabelTextStyle,
                    ),
                    Text(weight.toString(),
                    style: kNumberStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // FloatingActionButton(
                        //     backgroundColor:Color(0xFF4C4F5E),
                        //     child:Icon(Icons.add,color:Colors.white,),
                        //     onPressed: onPressed,
                        // ),
                        RoundIconButton(icon: FontAwesomeIcons.plus,
                          onPressed:() {
                        setState(() {
                          weight++;
                        });
                        }),
                        SizedBox(width: 10.0),
                        RoundIconButton(icon: FontAwesomeIcons.minus,
                        onPressed: (){
                          setState(() {
                            weight--;
                          });
                        },),
                      ],
                    )

                  ],
                ),
                ),
              ),
                Expanded(
                  child:RecurringContainer(colour:kActiveCardColor,
                  cardChild:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("AGE",
                      style: kLabelTextStyle,),
                      Text(
                        age.toString(),
                        style: kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                            setState(() {
                              age++;
                            });
                          }
                          ),
                          SizedBox(width:10.0),
                          RoundIconButton(icon: FontAwesomeIcons.minus, onPressed:(){
                            setState(() {
                              age--;
                            });
                          }),

                        ],
                      ),
                    ],
                  ),),

                ),
              ],
            ),
          ),
              BottomButton(onTap:          (){
               //setState(() {
                CalculatorBMI calc=CalculatorBMI(height: height,weight: weight);
               Navigator.push(context,MaterialPageRoute(builder: (context) => ResultsPage(
                 bmiResults: calc.calculateBMI(),
                 bmiText: calc.getResult(),
                 bmiAdvice: calc.interpretation(),
               )
               )
               );

               }, buttonTitle: 'CALCULATE'),
        ],
      ),



    );
    }
  }


