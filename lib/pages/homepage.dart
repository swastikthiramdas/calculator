import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int firstnumber = 0;
  int secondnumber = 0;
  String textToDisplay = "";
  String res = "";
  String operatorperform = "";


  void btnclicked(String btnval){
    if(btnval == "C"){
      firstnumber = 0;
      secondnumber = 0;
      res = "";
    }
    else if(btnval == "+" || btnval == "-" || btnval == "x" || btnval == "/"){
      firstnumber = int.parse(textToDisplay);
      res = "";
      operatorperform = btnval;
    }
    else if(btnval == "="){
      secondnumber = int.parse(textToDisplay);
      if(operatorperform == "+"){
        res = (firstnumber + secondnumber).toString();
      }
      if(operatorperform == "-"){
        res = (firstnumber - secondnumber).toString();
      }
      if(operatorperform == "x"){
        res = (firstnumber * secondnumber).toString();
      }
      if(operatorperform == "/"){
        res = (firstnumber / secondnumber).toString();
      }
    }
    else{
      res = int.parse(textToDisplay + btnval).toString();
    }

    setState(() {
      textToDisplay = res;
    });
  }


  Widget ButtonView(String btnval) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blue,
          padding: EdgeInsets.all(30.0),
          onPressed: () => btnclicked(btnval),
          child: Text("$btnval",style: TextStyle(fontSize: 28),)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.bottomRight,
                child: Text("$textToDisplay",style: TextStyle(fontSize: 36.0,fontWeight: FontWeight.w600)),
              )
          ),
          Row(
            children: [
              ButtonView("9"),
              ButtonView("8"),
              ButtonView("7"),
              ButtonView("+"),
            ],
          ),
          Row(
            children: [
              ButtonView("6"),
              ButtonView("5"),
              ButtonView("4"),
              ButtonView("-"),
            ],
          ),
          Row(
            children: [
              ButtonView("3"),
              ButtonView("2"),
              ButtonView("1"),
              ButtonView("x"),
            ],
          ),
          Row(
            children: [
              ButtonView("C"),
              ButtonView("0"),
              ButtonView("="),
              ButtonView("/"),
            ],
          ),
        ],
      ),
    );
  }
}
