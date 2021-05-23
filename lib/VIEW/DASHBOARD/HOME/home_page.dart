import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:mvc_pattern_amiizz_tutorial/CONTROLLER/contro.dart';
import 'package:mvc_pattern_amiizz_tutorial/MODEL/about_info.dart';
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

  File imgFile;

  @override
  void initState() {
    print("Staff ID - "+widget.staffId);
    // TODO: implement initState
    super.initState();
    // _con.getStatics(widget.staffId);
    _con.getAboutInfo(widget.staffId);
    _con.getAvailability(widget.staffId);
  }

  Future<Null> _pickImage() async {
    var file = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 20,
    );
    if (file != null) {
      setState(() {
        imgFile = file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("DahBoard"),
      ),
      body: _con.loading==false && _con.availList.data.length>0 && _con.aboutInfo.data!=null ?  SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text("Total Statics"),
                // Container(height: 3,width: 30,color: Colors.red,),
                // SizedBox(height: 10,),
                // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Container(
                //       height: 120,
                //       width: w/4.7,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8),
                //           color: Colors.yellow[800]
                //       ),
                //       child: Center(
                //         child: Container(
                //           height: 90,
                //           child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text("New\nRequests"),
                //               Container(
                //                 height: 35,
                //                 width: 35,
                //                 decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(100),
                //                     border: Border.all(color: CupertinoColors.white)
                //                 ),
                //                 child: Center(child: Text(_con.staticsData["newrequest"].toString(),style: TextStyle(color: Colors.white),)),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: 120,
                //       width: w/4.7,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8),
                //           color: Colors.blue[600]
                //       ),
                //       child: Center(
                //         child: Container(
                //           height: 90,
                //           child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text("Completed\nRequests"),
                //               Container(
                //                 height: 35,
                //                 width: 35,
                //                 decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(100),
                //                     border: Border.all(color: CupertinoColors.white)
                //                 ),
                //                 child: Center(child: Text(_con.staticsData["completed"].toString(),style: TextStyle(color: Colors.white),)),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: 120,
                //       width: w/4.7,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8),
                //           color: Colors.green[500]
                //       ),
                //       child: Center(
                //         child: Container(
                //           height: 90,
                //           child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text("Payslips"),
                //               Container(
                //                 height: 35,
                //                 width: 35,
                //                 decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(100),
                //                     border: Border.all(color: CupertinoColors.white)
                //                 ),
                //                 child: Center(child: Text(_con.staticsData["payslip"].toString(),style: TextStyle(color: Colors.white),)),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     Container(
                //       height: 120,
                //       width: w/4.7,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8),
                //           color: Colors.orange[900]
                //       ),
                //       child: Center(
                //         child: Container(
                //           height: 90,
                //           child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text("Reviews"),
                //               Container(
                //                 height: 35,
                //                 width: 35,
                //                 decoration: BoxDecoration(
                //                     borderRadius: BorderRadius.circular(100),
                //                     border: Border.all(color: CupertinoColors.white)
                //                 ),
                //                 child: Center(child: Text(_con.staticsData["reviews"].toString(),style: TextStyle(color: Colors.white),)),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                // SizedBox(height: 100,),
                Text("About Info"),
                Container(height: 3,width: 30,color: Colors.red,),
                SizedBox(height: 10,),
                Row(
                  children: [
                    imgFile !=null ? Container(
                        height: 80,
                        width: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: Image.file(imgFile,fit: BoxFit.cover,)) :  Container(
                        height: 80,
                        width: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(100)
                        ),
                        child: Image.network(_con.aboutInfo.data.avatar,fit: BoxFit.cover,)),
                    SizedBox(width: 20,),
                    MaterialButton(
                      height: 30,
                      minWidth: 100,
                      color: Colors.red,
                      onPressed: (){
                        imgFile !=null ? _con.updateProfile(context,imgFile.path,p.extension(imgFile.path),widget.staffId) :  _pickImage();
                      },
                      child: Center(child: Text(imgFile !=null ?  "Update":"Change profile",style: TextStyle(color: Colors.white),),),
                    )
                  ],
                ),
                SizedBox(height: 10,),
                Text("Name : "+_con.aboutInfo.data.name),
                SizedBox(height: 7,),
                Text("Email : "+_con.aboutInfo.data.email),
                SizedBox(height: 7,),
                Text("Phone : "+_con.aboutInfo.data.phone),
                SizedBox(height: 30,),
                SizedBox(height: 30,),
                Text("Availability"),
                Container(height: 3,width: 30,color: Colors.red,),
                SizedBox(height: 10,),
                _con.availList.data.length>0 ?  Container(height: _con.availList.data.length.toDouble() * 100,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      itemCount: _con.availList.data.length,
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
                                        Text(DateFormat.d().format(DateTime.parse(_con.availList.data[index].availDate)),),
                                        SizedBox(width: 7,),
                                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(DateFormat.E().format(DateTime.parse(_con.availList.data[index].availDate)),),
                                            SizedBox(height: 1,),
                                            Text(DateFormat.y().format(DateTime.parse(_con.availList.data[index].availDate))),
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
                                                  Text(_con.availList.data[index].shiftName,),
                                                ],
                                              ),
                                              Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Time:",),
                                                  SizedBox(height: 2,),
                                                  // Text("12:30 pm - 4:00 pm")
                                                  Row(
                                                    children: [
                                                      Text(int.parse((_con.availList.data[index].availStarttime.toString().
                                                      split(":")[0]))>=12 ? _con.availList.data[index].availStarttime+" pm  -  " :
                                                      _con.availList.data[index].availStarttime+" am  -  ",),
                                                      Text(int.parse((_con.availList.data[index].availEndtime.toString().
                                                      split(":")[0]))>=12 ? _con.availList.data[index].availEndtime+" pm" :
                                                      _con.availList.data[index].availEndtime+" am"),
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
