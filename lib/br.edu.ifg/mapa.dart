import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


Future<void> _initService() async {
  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.locationAlways
  ].request();
  if(await Permission.locationAlways.isGranted){
    FlutterBackgroundService().startService();
  }
}


class _MyHomePageState extends State<MyHomePage> {
  Position? _currentPosition;
  Timer? _timer;
  Future<void> _showLoc() async{
    _timer = Timer.periodic(const Duration(seconds: 20), (timer) async {
      Position p = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState((){
        _currentPosition = p;
      });
    });
  }

  Future<void> _stopLoc() async{
    _timer?.cancel();
    setState((){
      _currentPosition = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              const SizedBox(height: 32),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final service = FlutterBackgroundService();
          var isRunning = await service.isRunning();
          if (isRunning) {
            print("is running");
            service.invoke("stopService");
            _stopLoc();
          } else {
            _initService();
            _showLoc();
          }
          setState(() {});
        },
        tooltip: 'Position',
        child: const Icon(Icons.add_card),
      ),
    );
  }
}