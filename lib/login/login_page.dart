import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// "Global Key": is used to view AND manipulate the State of the Form,
  ///  BECAUSE we cannot manipulate OR validate the form through THEIR children widget
  ///   like 'TextFormField's, THEN we passe it inside the 'Form()' as a reference object.*/
  final keyFormState = new GlobalKey<FormState>();

  ///Method for Regular Expression Validator for the 'Username login':
  String regExpValidatorUsernameLogin(String value) {
    String pattern= r'(^[a-zA-Z-.]{8}[0-9]+\W*$)';
    RegExp regExp = new RegExp(pattern);
    if(regExp.hasMatch(value)){
      return null;
    }else{
      return "Please Enter 8 letters & 1 or more numbers".toUpperCase();
    }
  }//regExpValidatorUsernameLogin()

  ///Method for Regular Expression Validator for the 'password':
  String regExpValidatorPasswordLogin(String value){
    // the pattern down below was imported.
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~-]|_|.).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if(regExp.hasMatch(value)){
      return null;
    }else{
      return "Minimum 1 Upper case & 1 Lower case letters & 1 number & 1 Upper case & 1 of (! @ # & * ~ )";
    }
  }//stringRegExpValidator(...)
  var username;
  var password;

/// validator function: */
  void send(){
    //we save the current state of the form THROUGH the '_formKey' in a variable 'formData':
    var formData= keyFormState.currentState;
    if(formData.validate()){
      //If there was no problems: we valid the input data THEN save it:
      formData.save();
      print('username: $username');
      print('password: $password');
      //If there was no problems on CHECKING the data entered by the user:
      print("valid input");
      Navigator.pushNamed(context, '/home');
    }else{
      print('Invalid input!');
    }
  }//send()

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Login Page',
          style: TextStyle(
                   // fontWeight: FontWeight.bold,
                    fontSize: 30
            ),),
        centerTitle: true,
      ),
      body: Form(
        key: keyFormState,

        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: TextFormField(
 //onSave() Function : to save user's data from input to the app:
                onSaved: (newValue) {
                  username = newValue;
                },

                //Auto Checking the length of the 'text' WHILE typing on the form:
                autovalidate: true,
           //Checking the condition of the value returned BY the 'validator' property:
                validator: regExpValidatorUsernameLogin,
                decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                  icon: Icon(Icons.person),
                  labelStyle: TextStyle(fontSize: 30),
                  labelText: 'Name',
                  hintText: 'Enter your name'
                ),
              ),
            ),
            SizedBox(height: 20,),
            Flexible(
              flex: 1,
              child: TextFormField(
                validator: regExpValidatorPasswordLogin,
                //To save the input entered by the user:
                onSaved: (newValue) {
                  password = newValue;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                    icon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility_off),
                    labelStyle: TextStyle(fontSize: 30),
                    labelText: 'Password',
                    hintText: 'Enter your password'
                ),
                obscureText: true,
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 150,
                  height: 50,
                  child: RaisedButton(
                        color: Colors.blue,
                        onPressed:
                          //send Function:
                          send,
                        child: Text('Login',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white),),
                    ),
                ),
              ),
              ),
            Flexible(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomCenter,

                child: ListTile(
                  title: Row(
                    children: [
                      Text(
                        'Don\'t you have an account yet? ' ,
                        style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),),
                      RaisedButton(
                        onPressed: (){
                          Navigator.pushNamed(context, '/signUp');
                        },
                        child: Text(
                                  'Sign Up!',
                                   style: TextStyle(fontSize: 20),),
                        textColor: Colors.white,
                        color: Colors.indigo,
                      )
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }


}
