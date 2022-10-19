import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map recievedDataFromScreen = {};

  @override
  Widget build(BuildContext context) {
    recievedDataFromScreen = recievedDataFromScreen.isEmpty
        ? recievedDataFromScreen =
            ModalRoute.of(context)!.settings.arguments as Map
        : recievedDataFromScreen;
    String backgroundImage =
        recievedDataFromScreen["isDayTime"] ? "day.png" : "night.png";
    return Scaffold(
      appBar: AppBar(
        title: const Text("HOME"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 55, 53, 63),
          image: DecorationImage(
              image: AssetImage("assets/$backgroundImage"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    if (result == null) {
                      recievedDataFromScreen = {
                        "time": "",
                        "location": "please choose a location ✋",
                        "isDayTime": false,
                      };
                    } else {
                      recievedDataFromScreen = {
                        "time": result["time"],
                        "location": result["location"],
                        "isDayTime": result["isDayTime"],
                      };
                    }
                  });
                },
                icon: const Icon(Icons.edit_location,
                    color: const Color.fromARGB(255, 255, 129, 129), size: 24.0),
                label: const Text(
                  "Edit Location",
                  style: TextStyle(fontSize: 19),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(146, 90, 103, 223)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(22)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                ),
              ),
              const SizedBox(
                height: 300,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 33),
                width: double.infinity,
                color: const Color.fromARGB(111, 0, 0, 0),
                child: Column(
                  children: [
                    Text(
                      recievedDataFromScreen["time"],
                      style: const TextStyle(fontSize: 55, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(
                      recievedDataFromScreen["location"],
                      style: const TextStyle(fontSize: 28, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
