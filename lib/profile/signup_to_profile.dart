import 'package:flutter/material.dart';
import 'package:login_finance/signUp/sign_up_page.dart';

class ProfilePage extends StatefulWidget {
  var name;
  var email;
  var phone;
  var address;
  var city;

  ProfilePage({this.name, this.email, this.address, this.city, this.phone});

  // SignUpPage signUpPage;
  // ///Dependency Injection of 'SignUpPage' into 'ProfilePage()' Constructor:
  // ProfilePage({@required this.signUpPage});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to your profile', ),
        centerTitle: true,
        ///Logout button added:
        actions: [
          FlatButton.icon(onPressed: (){
            Navigator.pushNamed(context, "/login");
          }, label: Text('logout', style: TextStyle(color: Colors.orange, fontSize: 15, fontWeight: FontWeight.bold),), icon: Icon(Icons.arrow_back, color: Colors.orange,))
        ],
      ),
      body:
     ///Couldn't get the data FROM the 'SignUpPage' widget AND display it in the here:
                         Container(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children:[
                                   SizedBox(height: 10,),
                                   Text('Your name is: ${widget.name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                                   SizedBox(height: 15,),
                                   Text('Your email is:  ${widget.email}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                                   SizedBox(height: 15,),
                                   Text('Your phone is:  ${widget.phone}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                                   SizedBox(height: 15,),
                                   Text('Your address is:  ${widget.address}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                                   SizedBox(height: 15,),
                                   Text('Your city is:  ${widget.city}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                                   SizedBox(height: 10,),
                                   Flexible(
                                     child: FlatButton.icon(
                                        color: Colors.deepOrange,
                                        onPressed: (){
                                           Navigator.pushNamed(context, "/home");
                                          },
                                         icon: Icon(Icons.home),
                                         label: Text('Go to Home')),
                                   ),
                                   SizedBox(height: 10,)

                                 ]
                               ),
                          /// new ProfilePage()
                           // child: new SignUpPage(
                           //     username: widget.signUpPage.username, email: widget.signUpPage.email,
                           //     phoneNumber: widget.signUpPage.phoneNumber, city: widget.signUpPage..city,
                           //     address: widget.signUpPage.address),
                         )
    );
  }
}
