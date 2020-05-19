import 'package:flutter/material.dart' ;
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

  String key;
  String active = '0';
  String recovered = '0';
  String fatal = '0';

  
class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void getdata() async{
    final records = await _firestore.collection('record').getDocuments();

    for (var data in records.documents){
      active = data.data['active'];
      recovered = data.data['recovered'];
      fatal = data.data['fatal'];
    }
    setState(() {});
  }

@override
  void initState() {
    super.initState();
    getdata();
    
    }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'COVID-19 Tracker',
        ),
      ),
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 50.0,
                      child: Text(
                        'Recovered',
                        textAlign: TextAlign.center,
                        style: kTitleTextStyle,
                      ),
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(top: 15.0),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                    Container(
                      width: 120.0,
                      height: 50.0,
                      child: Text(
                        recovered,
                        textAlign: TextAlign.center,
                        style: kTitleTextStyle,
                      ),
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 50.0,
                      child: Text(
                        'Active',
                        style: kTitleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(top: 15.0),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                    Container(
                      width: 120.0,
                      height: 50.0,
                      child: Text(
                        active,
                        style: kTitleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 120.0,
                      height: 50.0,
                      child: Text(
                        'Fatal',
                        style: kTitleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(top: 15.0),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                    Container(
                      width: 120.0,
                      height: 50.0,
                      child: Text(
                        fatal,
                        style: kTitleTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.all(10.0),
                      margin: EdgeInsets.only(top: 10.0,bottom: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: WebviewScaffold(
              appBar: AppBar(
                title: Text('Ulhasnagar Map'),
                centerTitle: true,
                backgroundColor: Colors.blueGrey[800],
              ),
              url: "https://manav-motwani.github.io/test/",

            ),
          ),
        ],
      ),
    );
  }
}

// class Record {
  

//   Record({this.active,this.fatal,this.recovered});

//   Record.fromSnapshot(DataSnapshot snapshot){
//     key = snapshot.key;
//     active = snapshot.value['active'];
//     recovered = snapshot.value['recovered'];
//     fatal = snapshot.value['fatal'];

//   }

// }