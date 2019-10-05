import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class BMI{
  double weight;
  double height;
  double result;
  var cat;
  Color col;
  BMI(){
    weight = 40;
    height = 150;
    result = 0.0;
    cat = "";
  }
  
  void setWeight(var a){
    weight = a;
  }
  
  void setHeight(var a){
    height = a;
  }
  void set1(){
    weight = 40;
    height = 150;
    result = 0.0;
    cat = "";
  }
  void set(var a){
      result = a;
  }
  void eval(){
    if(result < 18.5){
      cat = "Underweight";
      col = Colors.blueAccent;
    }
    else if(result < 24.9) {
      cat = "Normal";
      col = Colors.green;
    }
    else if(result < 29.9) {
      cat = "Overweight";
      col = Colors.redAccent;
    }
    else if(result < 34.9){
      cat = "Obese I";
      col = Colors.redAccent;
    }
    else if(result < 39.9){
      cat = "Obese II";
      col = Colors.redAccent;
    }
    else{
      cat = "Extreme Obesity";
      col = Colors.red;
    }
  }
}

BMI obj = new BMI();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/home' : (BuildContext context) => MyHomePage(),
        '/weight' : (BuildContext context) => Page1(),
        '/height' : (BuildContext context) => heightPage()
      }
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomePage> {
  var r = obj.result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      
    ),
    body: Stack(
      children: <Widget>[
        Container(
          child: new Image.asset('images/clouds1.png', width: double.infinity, height: double.infinity, fit: BoxFit.fill,),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top : 40.0),
              child: Center(
                child: Text('BMI Calculator', style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),)
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.transparent,
              child: DragTarget(
                  builder: (context, List<int> candidateData, rejectedData){
                    print(candidateData);
                    return Center(child: Text("", style: TextStyle(color: Colors.white, fontSize: 22.0),));
                  },
                onWillAccept: (data) { return true;},
                onAccept: (data){
                    if(data == 1) {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => Page1()));
                    }
                },
              ),
            ),
            new Expanded(child: Container()),
            Text("Launch the Rocket to reach the skies", style: TextStyle(fontSize: 14),),
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: new Draggable(
                  axis: Axis.vertical,
                  child: Image.asset('images/launch.png', width: 120,),
                  childWhenDragging: Container(height: 120,),
                  feedback: Image.asset('images/launch.png', width: 120,),
                  data: 1,
              ),

            )
          ],
        )
      ],
    )
    );
  }
}

class Page1 extends StatefulWidget{
  @override
  _Page1State createState() => _Page1State();

}

class _Page1State extends State <Page1>{
  var r = obj.result;
  var weight = obj.weight;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          children: <Widget>[
            new Expanded(child: Container()),
            Center(
              child: Image.asset('images/weight.png', scale: (0.5 * (150/obj.weight))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Center(
                child: Text("WEIGHT (Kg)", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, fontFamily: 'Open Sans', color: Colors.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Center(
                child: Text(obj.weight.toString(), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 48, fontFamily: 'Open Sans', color: Colors.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: new Container(
                width: double.infinity,
                height: 60,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    new Expanded(child: Container()),
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 20,
                        inactiveTrackColor: Colors.white,
                        thumbColor: Colors.white.withOpacity(1.0),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0, disabledThumbRadius: 20.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          width: 300,
                          child: new Slider(
                              value: obj.weight,
                              min: 30,
                              max: 150,
                              divisions: 120,
                              activeColor: Colors.white.withOpacity(0.8),
                              inactiveColor: Colors.white.withOpacity(0.2),
                              onChanged: (_value) {
                                setState(() {
                                  this.weight = _value;
                                  obj.setWeight(_value);
                                });
                              },

                          ),
                        ),
                      ),
                    ),
                    new Expanded(child: Container())
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0, left: 40.0),
                  child: new Container(
                    width: 90,
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      color: Colors.white.withOpacity(0.2),
                    ),
//                    color: Colors.white.withOpacity(0.2),
                    child: new IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: () {
                      Navigator.pop(context);
                    }),
                  ),
                ),
                new Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0, right: 0.0),
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: new Container(
                          width: 180,
                          height: 55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(40.0))
                          ),
                          child: new Center(
                            child: Text("Next", style: TextStyle(fontSize: 20, color: Colors.green, fontFamily: 'Roboto', fontWeight: FontWeight.bold), ),
                          )
                      ),

                      onPressed: () {
                          Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => heightPage()));
                        },
                      ),
//                      new Container(
//                          width: 200,
//                          height: 55,
//                          decoration: BoxDecoration(
//                              color: Colors.white,
//                              borderRadius: BorderRadius.all(Radius.circular(40.0))
//                          ),
//                          child: new Center(
//                            child: Text("Next", style: TextStyle(fontSize: 20, color: Colors.green, fontFamily: 'Roboto', fontWeight: FontWeight.bold), ),
//                          )
//                      ),

                    ],
                  ),
                ),

              ],
            )
          ],
        ),
      )
    );
  }

}

// ignore: camel_case_types
class heightPage extends StatefulWidget{
  @override
  _HeightPage createState() => _HeightPage();

}

class _HeightPage extends State <heightPage>{
  var height = obj.height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Center(
        child: Column(
          children: <Widget>[
            new Expanded(child: Container()),
            Center(
              child: Image.asset('images/height.png', scale: 0.5 * (240 / obj.height),),
            ),
            Padding(
              padding: const EdgeInsets.only(top :40.0),
              child: Center(
                child: Text("HEIGHT (cm)", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, fontFamily: 'Open Sans', color: Colors.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Center(
                child: Text(obj.height.toString(), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 48, fontFamily: 'Open Sans', color: Colors.white),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: new Container(
                width: double.infinity,
                height: 60,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    new Expanded(child: Container()),
                    SliderTheme(
                      data: SliderThemeData(
                          trackHeight: 20,
                          inactiveTrackColor: Colors.white,
                          thumbColor: Colors.white.withOpacity(1.0),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0, disabledThumbRadius: 20.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Container(
                          width: 300,
                          child: new Slider(
                            value: obj.height,
                            min: 120,
                            max: 240,
                            divisions: 120,
                            activeColor: Colors.white.withOpacity(0.8),
                            inactiveColor: Colors.white.withOpacity(0.2),
                            onChanged: (_value) {
                              setState(() {
                                this.height = _value;
                                obj.setHeight(_value);
                              });
                            },

                          ),
                        ),
                      ),
                    ),
                    new Expanded(child: Container())
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0, left: 40.0),
                  child: new Container(
                    width: 90,
                    height: 55,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                      color: Colors.white.withOpacity(0.2),
                    ),
//                    color: Colors.white.withOpacity(0.2),
                    child: new IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.white,), onPressed: () {
                      Navigator.pop(context);
                    }),
                  ),
                ),
                new Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0, right: 0.0),
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: new Container(
                            width: 180,
                            height: 55,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(40.0))
                            ),
                            child: new Center(
                              child: Text("Calculate", style: TextStyle(fontSize: 20, color: Colors.redAccent, fontFamily: 'Roboto', fontWeight: FontWeight.bold), ),
                            )
                        ),

                        onPressed: () {
                          var r = obj.weight / (obj.height * obj.height);
                          r = r * 10000;
                          obj.set(r);
                          obj.eval();
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => ResultPage()));
                        },
                      ),

                    ],
                  ),
                ),

              ],
            )
          ],
        ),
      )
    );
  }
}

class ResultPage extends StatefulWidget{
  @override
  _ResultsPage createState() => _ResultsPage();

}

class _ResultsPage extends State <ResultPage>{
  var r = obj.result.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: obj.col,
      body: Stack(
        children: <Widget>[
          FlareActor(
            "images/clouds.flr",
            animation: "movement",
            
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top : 220),
                child: Center(
                    child: Text(r.substring(0,4), style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: new Container(
                  child: new Text(obj.cat, style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.transparent,
              ),
              new Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    border: Border.all(color: Colors.black54, width: 2.0)
                  ),
                  child: IconButton(
                      icon: Icon(
                        Icons.refresh,
                        color: Colors.black54,
                        size: 30,
                      ),
                      onPressed: () {
                          obj.set1();
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                      }
                  ),
                )

              )
            ],
          )
        ],
      )
    );
  }

}