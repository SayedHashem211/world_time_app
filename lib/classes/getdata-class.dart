import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'package:world_time_app/classes/getdata-class.dart';

class AllCountries {
  final String flag;
  final String countryName;
  final String link;

  AllCountries({required this.flag, required this.countryName , required this.link});
  late bool isDayTime;
  late String timeNow;
  late String timeZone;

  getData() async {
    Response recievedDataFromAPI = await get(
        Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
    Map recievedData = jsonDecode(recievedDataFromAPI.body);
    String datetime = recievedData["utc_datetime"];
    DateTime dateTime = DateTime.parse(datetime);

    String offset = recievedData["utc_offset"].substring(0, 3);
    int intOffset = int.parse(offset);

    DateTime realTime = dateTime.add(Duration(hours: intOffset));

    if (realTime.hour > 5 && realTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }

    timeNow = DateFormat('hh:mm a').format(realTime);

    timeZone = recievedData["timezone"];
  }
}
