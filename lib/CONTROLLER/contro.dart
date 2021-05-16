import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mvc_pattern_amiizz_tutorial/REPOSITORY_API/repo.dart' as repo;
import  'package:flutter/src/widgets/framework.dart' as s;
import 'package:mvc_pattern_amiizz_tutorial/VIEW/DASHBOARD/HOME/home_page.dart';

class AmiizController extends ControllerMVC {

  GlobalKey<ScaffoldState> scaffoldKey;
  GlobalKey<FormState> RegFormKey;

  AmiizController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    RegFormKey = new GlobalKey<FormState>();
  }

  bool loading = true;
  var staticsData;
  var userData;
  List availabilityList = [];

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
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) => HomePage(staffId: value["id"].toString(),)
          ), (route) => false);
        }
      else{
        print("LOGIN FAIL *****************************");
        Fluttertoast.showToast(
          msg: value["message"].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 35,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    });
  }

  void getStatics(staff) async {
    repo.getStatics(staff).then((value) {
      print("Response Statics --> "+value.toString());
      setState(() {
        staticsData = value["data"];
        loading = false;
      });
      print("Setted value of Statics : "+staticsData.toString());
    });
  }

  void getAboutInfo(staff) async {
    repo.getAboutInfoRepo(staff).then((value) {
      print("Response About Info --> "+value.toString());
      setState(() {
        userData = value["data"];
        loading = false;
      });
      print("Setted value of About Info : "+userData.toString());
    });
  }

  void getAvailability(staff) async {
    repo.getAvailabilityRepo(staff).then((value) {
      print("Response Availability List --> "+value.toString());
      setState(() {
        availabilityList = value["data"];
        loading = false;
      });
      print("Setted value of Availability List : "+availabilityList.toString());
      print("Setted value of Availability List  length : "+availabilityList.length.toString());
    });
  }

}