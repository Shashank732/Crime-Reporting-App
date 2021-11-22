import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peoplesafety/Screens/get_instant_help.dart';
import 'package:peoplesafety/Screens/report_crime.dart';
import 'package:peoplesafety/widgets/home_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              child: ElevatedButton(
                child: Text('Report Crime'),
                onPressed: (){
                  Get.to(ReportCrime());
                },
              ),
            ),
            Container(
              width: 150,
              child: ElevatedButton(
                child: Text('Get Instant Help'),
                onPressed: (){
                  Get.to(GetInstantHelp());
                },
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('People Safety'),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: HomeDrawer(),
    );
  }
}
