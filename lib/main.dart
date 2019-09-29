import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomePage> {
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
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => LaunchedPage()));
                    }
                },
              ),
            ),
            new Expanded(child: Container()),
            Text("Launch the Rocket to reach the skies", style: TextStyle(fontSize: 12),),
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

class LaunchedPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Page1()
    );
  }
}


class Page1 extends StatefulWidget{
  @override
  _Page1State createState() => _Page1State();

}

class _Page1State extends State <Page1>{
  var weight = 40.0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          children: <Widget>[
            new Expanded(child: Container()),
            Center(
              child: Text("WEIGHT (Kg)", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20, fontFamily: 'Open Sans', color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Center(
                child: Text(weight.toString(), style: TextStyle(fontWeight: FontWeight.w900, fontSize: 48, fontFamily: 'Open Sans', color: Colors.white),),
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
                              value: weight,
                              min: 30,
                              max: 150,
                              divisions: 120,
                              activeColor: Colors.white.withOpacity(0.8),
                              inactiveColor: Colors.white.withOpacity(0.2),
                              onChanged: (_value) {
                                setState(() {
                                  weight = _value;
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
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MyHomePage()));
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HeightPage()));
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

class HeightPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: heightPage(),
    );
  }
}

// ignore: camel_case_types
class heightPage extends StatefulWidget{
  @override
  _HeightPage createState() => _HeightPage();

}

class _HeightPage extends State <heightPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }

}