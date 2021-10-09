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
            child: RaisedButton(
              color: Colors.cyanAccent,
              padding: EdgeInsets.all(80),
              onPressed: (){},
              child: Text('Give Loans', style: TextStyle(fontSize: 22, color: Colors.black)),
            ),
          ),
          SizedBox(height: 20,),

          Flexible(
            flex: 2,
            child: RaisedButton(
              color: Colors.redAccent,
              padding: EdgeInsets.all(65),
              onPressed: (){},
              child: Text('Borrow Money', style: TextStyle(fontSize: 22, color: Colors.black)),
            ),
          ),
          SizedBox(height: 20,),

          Flexible(
            flex: 2,
            child: RaisedButton(
              color: Colors.green,
              padding: EdgeInsets.all(80),
              onPressed: (){},
              child: Text('Donate Money', style: TextStyle(fontSize: 22, color: Colors.black)),
            ),
          ),
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
