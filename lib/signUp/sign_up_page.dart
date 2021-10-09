import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:login_finance/shared/widgets/text_field_item.dart';

class SignUpPage extends StatefulWidget {
  ///I couldn't use setState(){] in this class:
  @override
  _SignUpPageState createState() => _SignUpPageState();
}
//Class converted FROM Stateless TO Stateful widget:
class _SignUpPageState extends State<SignUpPage> {
  //GlobalKey added to uniquely identify the Form() widget:
  final formKey = new GlobalKey<FormState>();
/// Properties of the state:
  var phoneNumber;
  var email;
  String username;
  var city;
  var newPassword;
  var address;
  /**Instead of the 'validator: (value){...}' function down below,
   *  I have used Regular expression function ex: "stringRegExpPhoneNumValidator" to check the
   *  corresponding input*/

/// validator function: */
  onCheck(){
    var formData = formKey.currentState;
    if(formData.validate()){
      formData.save();
      print('Phone phoneNumber: $phoneNumber');
      print('Username: $username');
      print('Email: $email');
      print('City: $city');
      print('Address: $address');
      print('New password: $newPassword');
      Navigator.pushNamed(context, "/home");
    }else{
      print('Invalid input');
    }
  }//onCheck()
  ///Method for Regular Expression Validator for the 'Username' entered in the input BY the user:
  String regExpUsernameValidator(String value) {
    String pattern= r'(^[a-zA-Z-.]+[0-9]*$)';
    RegExp regExp =  new RegExp(pattern);
    if(regExp.hasMatch(value)){
      return null;
    }else{
      return "Please Enter a valid Username".toUpperCase();
    }
  }//regExpUsernameValidator(...)

  ///Method for Regular Expression Validator for the 'Email' entered in the input BY the user:
  String regExpEmailValidator(String value){
    String pattern= r'(^[a-zA-Z0-9.-]+@[a-zA-Z]+\.(com|net|edu|org|ma)$)';
    RegExp regExp = new RegExp(pattern);
    if(regExp.hasMatch(value)){
      return null;
    }else{
      return "Please Enter a valid Email".toUpperCase();
    }
  }//regExpEmailValidator(...)

  ///Method for Regular Expression Validator for the 'Phone number' entered in the input BY the user:
  String regExpPhoneNumValidator(String value){
    String pattern= r'(^([+]212|06){1}[0-9]{8}$)';
    RegExp regExp = new RegExp(pattern);
    if(regExp.hasMatch(value)){
      return null;
    }else{
      return "Please Enter a valid phone number".toUpperCase();
    }
  }//regExpPhoneNumValidator(...)

  ///Method for Regular Expression Validator for the 'City' entered in the input BY the user:
  String regExpCityValidator(String value){
    String pattern= r'(^[a-zA-Z]+$)';
    RegExp regExp = new RegExp(pattern);
    if(regExp.hasMatch(value)){
      return null;
    }else{
      return "Please Enter a valid City".toUpperCase();
    }
  }//regExpCityValidator(...)

  ///Method for Regular Expression Validator for the 'Address' entered in the input BY the user:
  String regExpAddressValidator(String value){
    String pattern= r'(^[a-zA-Z0-9]+\W[a-zA-Z]+\W[0-9]+$)';
    RegExp regExp = new RegExp(pattern);
    if(regExp.hasMatch(value)){
      return null;
    }else{
      return "Please Enter a valid Address".toUpperCase();
    }
  }//regExpEmailValidator(...)

  ///Method for Regular Expression Validator for the 'Password' entered in the input BY the user:
  String regExpPasswordValidator(String value){
    String pattern= r'(^[a-zA-Z0-9.-_]+@*$)';
    RegExp regExp = new RegExp(pattern);
    if(regExp.hasMatch(value)){
      return null;
    }else{
      return "Please Enter a valid Password".toUpperCase();
    }
  }//regExpPasswordValidator(...)

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Page'),
        centerTitle: true,
      ),
      body: Center(
        //Form widget was here:
          child: Form(
            key: formKey,
            //removed ListView() AND replaced with Column():
            child: ListView(
              children: [
                new TextFormFieldItem(
                  functionRegExp: (value)=>regExpUsernameValidator(value),
                  onSaved: (newValue)=>username=newValue,
                  icon: Icon(Icons.perm_identity),
                  label: 'User name',
                  hintTextItem: 'Please enter your User name',
                ),
                new TextFormFieldItem(
                    functionRegExp: (value)=> regExpEmailValidator(value),
                    onSaved: (newValue)=>email = newValue,
                    icon: Icon(Icons.email),
                    label: 'Email',
                    hintTextItem: 'Please enter your email'
                ),
                new TextFormFieldItem(
                    functionRegExp: (value)=>regExpPhoneNumValidator(value),
                    onSaved: (newValue)=>phoneNumber = newValue,
                    icon: Icon(Icons.phone),
                    label: 'Phone number',
                    hintTextItem: 'Please enter your Phone number'
                ),
                new TextFormFieldItem(
                    functionRegExp: (v)=>regExpCityValidator(v),
                    onSaved: (nv)=>city=nv,
                    icon: Icon(Icons.location_city),
                    label: 'City',
                    hintTextItem: 'Please enter your city'
                ),
                new TextFormFieldItem(
                    functionRegExp: (value)=>regExpAddressValidator(value),
                    onSaved: (nv)=>address=nv,
                    icon: Icon(Icons.add_location),
                    label: 'Address',
                    hintTextItem: 'Please enter your address',
                ),
                TextFormField(
 ///I couldn't use TextFormFieldItem(...) INSTEAD OF TextFormField(...) because I couldn't inject the field 'obscureText: true,' down below:
                  validator: regExpPasswordValidator, autovalidate: true,
                  onSaved: (newValue)=>newPassword=newValue,
                  decoration: InputDecoration(icon: Icon(Icons.lock_outline),
                      labelStyle: TextStyle(fontSize: 30), labelText: 'Add New Password',
                      hintText: 'Please enter a new password', suffixIcon: Icon(Icons.visibility_off)),
                  obscureText: true,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelStyle: TextStyle(fontSize: 30),
                      labelText: 'Re-enter your New Password',
                      hintText: 'Please Re-enter your new Password',
                      suffixIcon: Icon(Icons.visibility_off)
                  ),
                  obscureText: true,
                ),
                //Expanded() was down below:
                 Container(
                    // padding: EdgeInsets.all(40),
                    margin: EdgeInsets.fromLTRB(50 , 10, 50, 50),
                    alignment: Alignment.topCenter,
                    child: RaisedButton(
                      onPressed: onCheck,
                      child: Text('Submit registration', style: TextStyle(fontSize: 20),),
                      color: Colors.amber,
                    ),
                  ),
              ],
            ),
          )
      ),
    );
  }
}
