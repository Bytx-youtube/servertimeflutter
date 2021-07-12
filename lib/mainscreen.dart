import 'package:flutter/material.dart';
import 'package:ntp/ntp.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime ntpTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    _loadNTPTime();
  }

  void _loadNTPTime() async {
    setState(() async {
      ntpTime = await NTP.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Time :" + DateTime.now().toString()),
            Text("NTP Time :" + ntpTime.toString()),
            Text("Server Time :" + ntpTime.toUtc().toString()),
            Text("Local Time :" + ntpTime.toLocal().toString()),
          ],
        ),
      ),
    );
  }
}
