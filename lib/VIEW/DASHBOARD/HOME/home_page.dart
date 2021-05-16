import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mvc_pattern_amiizz_tutorial/CONTROLLER/contro.dart';
class HomePage extends StatefulWidget {

  HomePage({this.staffId});

  String staffId;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {

  AmiizController _con;

  _HomePageState() : super(AmiizController()) {
    _con = controller;
  }

  @override
  void initState() {
    print("Staff ID - "+widget.staffId);
    // TODO: implement initState
    super.initState();
    _con.getStatics(widget.staffId);
    _con.getAboutInfo(widget.staffId);
    _con.getAvailability(widget.staffId);
  }

  @override
  Widget build(BuildContext context) {

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("DahBoard"),
      ),
      body: _con.loading==false && _con.staticsData!=null && _con.userData !=null  ?  SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Total Statics"),
                Container(height: 3,width: 30,color: Colors.red,),
                SizedBox(height: 10,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 120,
                      width: w/4.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.yellow[800]
                      ),
                      child: Center(
                        child: Container(
                          height: 90,
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("New\nRequests"),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: CupertinoColors.white)
                                ),
                                child: Center(child: Text(_con.staticsData["newrequest"].toString(),style: TextStyle(color: Colors.white),)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 120,
                      width: w/4.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.blue[600]
                      ),
                      child: Center(
                        child: Container(
                          height: 90,
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Completed\nRequests"),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: CupertinoColors.white)
                                ),
                                child: Center(child: Text(_con.staticsData["completed"].toString(),style: TextStyle(color: Colors.white),)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 120,
                      width: w/4.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.green[500]
                      ),
                      child: Center(
                        child: Container(
                          height: 90,
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Payslips"),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: CupertinoColors.white)
                                ),
                                child: Center(child: Text(_con.staticsData["payslip"].toString(),style: TextStyle(color: Colors.white),)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 120,
                      width: w/4.7,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.orange[900]
                      ),
                      child: Center(
                        child: Container(
                          height: 90,
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Reviews"),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: CupertinoColors.white)
                                ),
                                child: Center(child: Text(_con.staticsData["reviews"].toString(),style: TextStyle(color: Colors.white),)),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Text("About Info"),
                Container(height: 3,width: 30,color: Colors.red,),
                SizedBox(height: 10,),
                CircleAvatar(
                    radius: 20,
                    child: Image.network(_con.userData["avatar"],fit: BoxFit.cover,)),
                SizedBox(height: 10,),
                Text("Name : "+_con.userData["name"].toString()),
                SizedBox(height: 7,),
                Text("Email : "+_con.userData["email"].toString()),
                SizedBox(height: 7,),
                Text("Phone : "+_con.userData["phone"].toString()),
                SizedBox(height: 30,),
                Text("Availability"),
                Container(height: 3,width: 30,color: Colors.red,),
                SizedBox(height: 10,),
               _con.availabilityList.length>0 ?  Container(height: _con.availabilityList.length.toDouble() * 100,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      itemCount: _con.availabilityList.length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Container(
                            decoration:  BoxDecoration(
                                color: Color(0xFFF7F7F7),
                                border: Border.all(color: Color(0xFFCCCCCC),width: 1),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(width: 100,
                                    child: Row(
                                      children: [
                                        Text(DateFormat.d().format(DateTime.parse(_con.availabilityList[index]["avail_date"])),),
                                        SizedBox(width: 7,),
                                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(DateFormat.E().format(DateTime.parse(_con.availabilityList[index]["avail_date"])),),
                                            SizedBox(height: 1,),
                                            Text(DateFormat.y().format(DateTime.parse(_con.availabilityList[index]["avail_date"]))),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),

                                  Container(
                                    width: w-168,
                                    child: Row(
                                      children: [
                                        Container(height: 50,width: 1,color:  Color(0xFFCCCCCC),),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Container(width: w-186,
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Shifts:",),
                                                  SizedBox(height: 2,),
                                                  Text(_con.availabilityList[index]["shift_name"],),
                                                ],
                                              ),
                                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Time:",),
                                                  SizedBox(height: 2,),
                                                  // Text("12:30 pm - 4:00 pm")
                                                  Row(
                                                    children: [
                                                      Text(int.parse((_con.availabilityList[index]["avail_starttime"].toString().
                                                      split(":")[0]))>=12 ? _con.availabilityList[index]["avail_starttime"]+" pm  -  " :
                                                      _con.availabilityList[index]["avail_starttime"]+" am  -  ",),
                                                      Text(int.parse((_con.availabilityList[index]["avail_endtime"].toString().
                                                      split(":")[0]))>=12 ? _con.availabilityList[index]["avail_endtime"]+" pm" :
                                                      _con.availabilityList[index]["avail_endtime"]+" am"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ) : Text("No Availabilities")
              ],
            ),
          ),
        ),
      )
          : Center(child: CircularProgressIndicator()) ,
    );
  }
}
