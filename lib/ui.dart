import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController ageControl= TextEditingController();
  final TextEditingController heightControl= TextEditingController();
  final TextEditingController weightControl= TextEditingController();
  var bmi='0.0';
  var result='';

  void calcBmi(){
    setState(() {
      int age= int.parse(ageControl.text);
      double height= double.parse(heightControl.text);
      double weight= double.parse(weightControl.text);

      if(ageControl.text.isNotEmpty || age>0
          && heightControl.text.isNotEmpty || height>0
          && weightControl.text.isNotEmpty || weight>0)
        {
          bmi=((weight/(height*height))*10000).toStringAsFixed(1);
        }
      if(double.parse(bmi.toString())< 18.5)
        {
          result="UNDERWEIGHT";
        }
      else if(double.parse(bmi.toString()) >=18.5 && double.parse(bmi.toLowerCase()) < 24.9)
        {
          result='NORMAL';
        }
      else if(double.parse(bmi.toString()) >25.0 && double.parse(bmi.toLowerCase()) < 29.9){
        result='OVERWEIGHT';
      }
      else if(double.parse(bmi.toString()) >=30.0){
        result='OBESE';
      }
      else{
        bmi='0.0';
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset('images/bg.jpg',fit: BoxFit.fill,height:MediaQuery.of(context).size.height),
          Positioned.directional(
            top: 25,
            textDirection: TextDirection.ltr,
            child: Text('BMI',style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold,color: Colors.white,letterSpacing: 2),),
          ),
          Positioned.directional(
            top: 100,
            textDirection: TextDirection.ltr,
            child: Text('Body Mass Index',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white,letterSpacing: 3),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 160, 10,0),
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[600].withOpacity(0.4),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextField(
                    controller: ageControl,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      icon: Icon(Icons.person,size: 40,),
                      labelText: 'Age',
                    ),
                  ),
                  TextField(
                    controller: heightControl,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      icon: Icon(Icons.height,size: 35,),
                      labelText: 'Height',
                      hintText: 'Height in cm',
                    ),
                  ),
                  TextField(
                    controller: weightControl,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                      icon: Icon(Icons.line_weight_rounded,size: 35,),
                      labelText: 'Weight',
                      hintText: 'Weight in kg',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
           top: 500,
            left: 120,
            right: 120,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: ElevatedButton(
                onPressed:(){
                  calcBmi();
                },
                child: Text('CALCULATE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[300].withOpacity(0.3),
                  minimumSize: Size(60,50),
                ),
              ),
            ),
          ),
          Positioned.directional(
            bottom: 200,
              textDirection: TextDirection.ltr,
              child: Text('BMI : $bmi',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.grey[800]),
              ),
          ),
          Positioned.directional(
            bottom: 162,
            textDirection: TextDirection.ltr,
            child: Text('$result',
              style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }
}
