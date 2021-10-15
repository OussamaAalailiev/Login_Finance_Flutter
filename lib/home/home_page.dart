import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home transactions'),
        centerTitle: true,
      ),
      body:  Column(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
    //MainAxisSize.min: to resolve the problem of 'renderPixels Overflow of Column Widget'.
    //       mainAxisSize: MainAxisSize.min,
        children: [
          /**I have chosen 'Flexible(flex: ..)' INSTEAD OF 'Expanded()' to resolve the
           *  overFlow rendering Objects Pixels: */
          SizedBox(height: 10,),
          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 100, 30, 30),
              child: RaisedButton(
                color: Colors.indigo,
                padding: EdgeInsets.all(10),
                onPressed: (){},
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 50,),
                      Image.asset('images/loan-money.png', color: Colors.white, height: 50,),
                      SizedBox(width: 50,),
                      Text('Give Loans', style: TextStyle(fontSize: 22, color: Colors.white))
                    ]
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),

          Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: RaisedButton(
                color: Colors.indigo,
                padding: EdgeInsets.all(10),
                onPressed: (){},
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 50,),
                      Image.asset('images/borrow-money-v2.png', height: 50,),
                      SizedBox(width: 50,),
                      Text('Borrow Money', style: TextStyle(fontSize: 22, color: Colors.white))
                    ]
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),

          // Flexible(
          //   flex: 2,
          //   child: RaisedButton(
          //     color: Colors.indigo,
          //     padding: EdgeInsets.all(80),
          //     onPressed: (){},
          //     child: Text('Donate Money', style: TextStyle(fontSize: 22, color: Colors.black)),
          //   ),
          // ),
          SizedBox(height: 20,),
        Flexible(
            flex: 1,
            child: Center(
              child: Text('@All rights are reserved.',
                       style: TextStyle(
                       fontSize: 17,
                       color: Colors.black),),
            )
         ),
        ],
      ),

    );
  }
}
