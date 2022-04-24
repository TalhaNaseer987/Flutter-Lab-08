import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Position? position;
  void getLocatoin() async {
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
      timeLimit: Duration(seconds: 5),
    );
    print(position);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocatoin();
    print('Permission Requested \n Init Component');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lab_8'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      getLocatoin();
                    });
                  },
                  child: Text('Get Location'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      onPrimary: Colors.white,
                      elevation: 30,
                      shadowColor: Colors.red,
                      shape: new RoundedRectangleBorder()))
            ],
          ),
        ),
      ),
    );
  }
}
