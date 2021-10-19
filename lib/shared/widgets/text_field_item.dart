import 'package:flutter/material.dart';

class TextFormFieldItem extends StatelessWidget {
  TextEditingController controller;
  Function functionRegExp;
  Function onSaved;
  Icon icon;
  String label;
  String hintTextItem;
  bool obscureText=false;

  TextFormFieldItem({@required this.functionRegExp,@required this.onSaved,
                    @required this.icon, @required this.label,@required this.hintTextItem,
                    this.obscureText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: functionRegExp,
      autovalidate: true,
      onSaved: onSaved,
      decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          labelStyle: TextStyle(fontSize: 30),
          labelText: label,
          hintText: hintTextItem
      ),
    );
  }
}
