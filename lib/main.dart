import 'package:bmi_calculator/ui.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMi'),
        centerTitle: true,
        elevation: 20,
        backgroundColor: Colors.indigo[800],
      ),
      body: Body(),
    );
  }
}
