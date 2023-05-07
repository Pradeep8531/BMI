import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget{

  var resultfromhome;

  Result(this.resultfromhome);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result', style: TextStyle(
          fontSize: 30,
          color: Colors.grey,
        )
          ,),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            SizedBox(
              height: 400,
              width: 300,
              child: Image(
                image: AssetImage('assets/images/measure.jpeg'),
              )
            ),
            Container(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Text('Your BMI is ',style: TextStyle(
                    fontSize: 60,
                    color: Colors.grey,

                  ),),
                ),
              ),
            ),
            Text(resultfromhome,style: TextStyle(
              fontSize: 60,
              color: Colors.yellow.shade900,
              fontWeight: FontWeight.bold,

            ),)
          ],
        ),
      ),

    );
  }

}
