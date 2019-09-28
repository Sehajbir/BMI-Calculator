import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          children: <Widget>[
            new Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: new Container(
                width: double.infinity,
                height: 80,
                color: Colors.red,
                child: Row(

                ),
              ),
            )
          ],
        ),
      )
    );
  }

}