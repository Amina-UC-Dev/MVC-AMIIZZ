import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mvc_pattern_amiizz_tutorial/REPOSITORY_API/repo.dart' as repo;
import  'package:flutter/src/widgets/framework.dart' as s;
class AmiizController extends ControllerMVC {

  GlobalKey<ScaffoldState> scaffoldKey;
  GlobalKey<FormState> RegFormKey;

  AmiizController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    RegFormKey = new GlobalKey<FormState>();
  }

  void signIn(context,username,password) async {

    print("VALUE  --> username  "+username+" pass "+password);

    showDialog(
        context: context,barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(backgroundColor: Colors.transparent,elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(25.0))),
              contentPadding: EdgeInsets.all(
                  0),
              content: StatefulBuilder(builder:
                  (BuildContext context, s.StateSetter state) {
                return Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("lib/load.gif",height: 90,color: Colors.red,),
                      ],
                    ),
                  ),
                );
              }));
        });

    repo.signInRepo(username,password).then((value) {
      Navigator.pop(context);
      print("Response LOGIN --> "+value.toString());
      if(value["status"].toString() == "200")
        {
          print("LOGIN SUCCESS ####################");
        }
      else{
        print("LOGIN FAIL *****************************");
      }
    });
  }

}