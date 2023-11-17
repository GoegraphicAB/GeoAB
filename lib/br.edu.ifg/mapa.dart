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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
        child: Text("OI"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final service = FlutterBackgroundService();
          var isRunning = await service.isRunning();
          if (isRunning) {
            print("is running");
          } else {
            _initService();
          }

          if (!isRunning) {
             print('Stop Service');
          } else {
            print('Start Service');
          }
          setState(() {});
        },
        tooltip: 'Position',
        child: const Icon(Icons.add),
      ),
    );
  }
}
