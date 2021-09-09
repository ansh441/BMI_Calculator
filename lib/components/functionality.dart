
import 'dart:math';
class CalculatorBMI{
  CalculatorBMI({this.weight,this.height});
  final int height;
  final int weight;
  double _bmi;
  String calculateBMI(){
    _bmi=weight/pow(height/100,2);

   return _bmi.toStringAsFixed(1);
  }


  String getResult(){
  if(_bmi>=25.0)
    return"Overweight";
  else if(_bmi>18.5)
    return"Normal";
  else
    return"Underweight";
  }

  String interpretation(){
    if(_bmi>=25)
      return"Try to exercise more and avoid sugary contents";
    else if(_bmi>18.5)
      return"Good Jobs!!Maintain your health as is it ";
    else
      return"Eat a bit more and take up more nutrients";
  }
}