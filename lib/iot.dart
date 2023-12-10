import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:http/http.dart' as http;

class iotScreen extends StatefulWidget {
  const iotScreen({super.key});

  @override
  State<iotScreen> createState() => _iotScreenState();
}

class _iotScreenState extends State<iotScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("iot devices simulation"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: ()async{
              var data = {
                        'to':"drsrYVosSbaPp25icEPitb:APA91bF2gcofsTT21hGwRp0Cit2QY1DqtXX720orwGcMKqwVMRPg9OACSG2jMrpRqyqri-IygTt7uHlbYm4_34RHMLtOM2uaAxKKBV2xushMX3O56lpGMfInCJYqi_6IQ-5jTgF0QLC4" ,
                        'priority': 'high',
                        'notification': {
                          'title': "ALERT: High Humidity Detected",
                          'body': 'Attention! The humidity level in the monitored area has exceeded the threshold. Current humidity: 75%. Action may be required to prevent potential damage or discomfort. Please check and regulate the environment accordingly.'
                        },
                      };
                      await http.post(
                          Uri.parse('https://fcm.googleapis.com/fcm/send'),
                          body: jsonEncode(data),
                          headers: {
                            'Content-Type': 'application/json; charset=UTF-8',
                            'Authorization': 'key=$api'
                          });
                    

            }, child: Text("humidity alert")
            ), 
            ElevatedButton(onPressed: (){

            }, child: Text("soil alert")
            ), 
            ElevatedButton(onPressed: (){

            }, child: Text("stealing alert")
            )
          ],
        ),
      ),
    );
  }
}