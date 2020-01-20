import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    //Make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/Europe/London');
    Map data = jsonDecode(response.body);

    //print(data);

    //get properties from data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'];
    //print(dateTime);
    //print(offset);

    //create datetime object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset.substring(1,3))));
    print(now);
  }

  @override
  void initState() {
    super.initState();
    getTime();
    //print('hello world!');


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('loading screen'),
    );
  }
}
