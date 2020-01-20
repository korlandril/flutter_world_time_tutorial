import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{
  String location; // Location name for the UI
  String time; //time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint


  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    //Make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    //print(data);

    //get properties from data
    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    //print(dateTime);
    //print(offset);

    //create datetime object
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));

    time = now.toString();
  }

}