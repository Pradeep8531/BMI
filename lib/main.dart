import 'package:bmi/splash_screen.dart';
import 'package:flutter/material.dart';

import 'Result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      color: Colors.white,
      home: splash_screen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   RangeValues values1 =  RangeValues(0,1);
   RangeValues values2 =  RangeValues(0,1);
   var weight;
   var height;
   var result = "";
   double bmi =0;
   bool _isBorderColored1 = false;
   bool _isBorderColored2 = false;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI', style: TextStyle(
          fontSize: 30,
          color: Colors.grey,
        ),)),
        backgroundColor: Colors.yellow,
      ),

      body:
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your Details ",style: TextStyle(fontSize: 40, color: Colors.grey, fontWeight: FontWeight.bold),),
            SizedBox(height: 40,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text("Gender :",style: TextStyle(fontSize: 15),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(children: [
                Expanded(
                child: Card(
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        _isBorderColored1 = !_isBorderColored1;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _isBorderColored1 ? Colors.yellow : Colors.white,
                          width: 5.0,
                        ),
                      ),
                    child: Image(
                      image: AssetImage('assets/images/young-man.png'),
                    ),),
                  ),
                ),
              ),
                Expanded(
                child:
                Card(
                  child:
                  InkWell(
                    onTap: (){
                      setState(() {
                        _isBorderColored2 = !_isBorderColored2;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: _isBorderColored2 ? Colors.yellow : Colors.white,
                          width: 5.0,
                        ),
                      ),
                      child: Image(
                      image: AssetImage('assets/images/businesswoman.png'),
                    ),),
                  ),
                ),
              )],),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Row(
                children: [
                  Expanded(child: Center(child: Text('Male',style: TextStyle(fontSize: 20),))),
                  Expanded(child: Center(child: Text('Female',style: TextStyle(fontSize: 20),))),
                ],
              ),
            ),
            Row(
              children: [Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Icon(Icons.line_weight,size: 20,),
            ), Expanded(child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("Choose your Weight", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                )),
              )), Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text("(In Kgs)"),
              )],),
            RangeSlider(//weight in kgs
                values: values1,
                min: 0,
                max: 200,
                divisions: 200,
                labels: RangeLabels(
                  values1.start.toStringAsFixed(1),
                  values1.end.toStringAsFixed(1),
                ),
                activeColor: Colors.yellow,
                inactiveColor: Colors.grey,
                onChanged: (Weight){
                  values1 = Weight;
                  weight = Weight.end.toDouble();
                  setState(() {

                  });
                }
            ),
            Row(
              children: [Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Icon(Icons.height,size: 20,),
            ), Expanded(child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Choose your Height", style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              )),
            )), Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Text("(In Cms)"),
            )],),
            RangeSlider(//heigh in cm
                values: values2,
                divisions: 300,
                min: 0,
                max: 300,
                labels: RangeLabels(
                  values2.start.toStringAsFixed(1),
                  values2.end.toStringAsFixed(1),
                ),
                activeColor: Colors.yellow,
                inactiveColor: Colors.grey,
                onChanged: (Height){
                  values2 = Height;
                  height = Height.end.toDouble();
                  setState(() {

                  });
                }
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
              primary: Colors.grey
              ),
                onPressed: (){

                  if(weight !=0 && height !=0 ){
                    double hgt = height/100;
                    bmi = weight/(hgt*hgt);
                    setState(() {
                      result = "${bmi.toStringAsFixed(3)}";
                    });
                  }
                  else{
                    setState(() {
                      result="Height and Weight Values Cannot be Null";
                    });
                  }
                  setState(() {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Result(result)));

                  });
                }
                , child: Text('Check')),
            SizedBox(height: 11,),
            /*
            Text(
              result, style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),)
*/
          ],
          
        ),
      )
    );
  }
}

