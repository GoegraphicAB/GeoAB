import 'dart:async';

import 'package:cron/cron.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geoab/firebase_options.dart';
import 'package:geoab/br.edu.ifg/mapa.dart';
import 'package:geoab/br.edu.ifg/modells/location.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  initializeService();
  runApp(
    const MyApp(),
  );
}

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'geoAB_LocationService', // id
    'GeoAB', // title
    description: 'I SEE YOU', // description
    importance: Importance.low, // importance must be at low or higher level
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await service.configure(
      androidConfiguration: AndroidConfiguration(
        onStart: onStart,
        isForegroundMode: true,
        autoStart: false,
        autoStartOnBoot: false,
        notificationChannelId: 'geoAB_LocationService',
        initialNotificationTitle: 'GeoAB',
        initialNotificationContent: 'I SEE YOU',
        foregroundServiceNotificationId: 666,
      ),
      iosConfiguration: IosConfiguration());
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  Cron _cron;

  _cron = Cron();
    ScheduledTask st = _cron.schedule(Schedule.parse('0 19 * 1-6,8-12 1-5'), () {
        Timer.periodic(const Duration(seconds: 20), (timer) async {
          if (!Schedule.parse('0 22 * 1-6,8-12 1-5').shouldRunAt(DateTime.now())) {
          await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
              .then((Position p) => {_updateGeoPoint(p)});
          }
        });
      });
  Cron _cronta;

  _cronta = Cron()
    ..schedule(Schedule.parse('0 22 * 1-6,8-12 1-5'), () {
      _cron.close();
    });

  service.on('stopService').listen((event) {
    service.stopSelf();
  });
}

Future<void> _updateGeoPoint(Position position) async {
  LocationGEO(
          id: "",
          longitude: position.longitude.toString(),
          latitude: position.latitude.toString(),
          altitude: position.altitude.toString(),
          timestamp: position.timestamp.toString())
      .UpdateLocation();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geographic Analysis Behavior',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Geographic Analysis Behavior'),
    );
  }
}
