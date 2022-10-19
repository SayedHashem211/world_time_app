import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_time_app/classes/getdata-class.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataLoadingPage() async {
    AllCountries oneCountry = AllCountries(countryName: "Egypt", flag: "egypt", link: "Africa/cairo");

    await oneCountry.getData();

    Navigator.pushReplacementNamed(context,'/home', arguments: {
      "time": oneCountry.timeNow,
      "location": oneCountry.timeZone,
      "isDayTime": oneCountry.isDayTime,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataLoadingPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SpinKitFadingCircle(
              size: 160.0,
              color: Color.fromARGB(146, 12, 16, 49),
            ),
          ],
        ),
      ),
    );
  }
}
