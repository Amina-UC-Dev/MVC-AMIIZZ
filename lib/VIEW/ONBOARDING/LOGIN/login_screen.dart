import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mvc_pattern_amiizz_tutorial/CONTROLLER/contro.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {

  AmiizController _con;

  _LoginScreenState() : super(AmiizController()) {
    _con = controller;
  }

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool autovalidate = false;

  _submit(){
    final FormState form = _con.RegFormKey.currentState;
    if (!form.validate()) {
      autovalidate = true;
      print("Fail @@@@@@@@@@@@@@@@ ");
    }
    else{
      form.save();
      print("Success #############");
      _con.signIn(context,_username.text, _password.text);
    }
  }

  @override
  Widget build(BuildContext context) {

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _con.RegFormKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Welcome"),
              SizedBox(height: 20,),
              Text("Sign in to continue"),
              SizedBox(height: 30,),
              TextFormField(
                validator: (val){
                  if(val.isEmpty)
                    return "Username required !!!";
                  else
                    return null;
                 /*
                 // for email validation
                 if (val.isEmpty)
                    return "Email is required!!!";
                 RegExp regex = new RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                  if (!regex.hasMatch(val))
                    return 'Please Enter Valid Email !!!';
                  return null;*/
                },
                controller: _username,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    focusedErrorBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red)
                    ),
                  labelText: "Username"
                    // email label
                 // labelText: "Username"
                ),
              ),
              SizedBox(height: 15,),
              TextFormField(
                validator: (val){
                  if (val.isEmpty)
                    return "Password is required!!!";
                  return null;
                },
                controller: _password,
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    focusedErrorBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    labelText: "Password"
                ),
              ),
              SizedBox(height: 30,),
              MaterialButton(minWidth: w,
                height: 45,
                color: Colors.red,
                splashColor: Colors.black,
                onPressed: (){
                _submit();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("SIGN IN",style: TextStyle(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
