import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geoab/br.edu.ifg/controller/AutService.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future<void> _initService() async {
  Map<Permission, PermissionStatus> statuses =
      await [Permission.location, Permission.locationAlways].request();
  if (await Permission.locationAlways.isGranted) {
    FlutterBackgroundService().startService();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  Position? _currentPosition;
  Timer? _timer;
  bool _isActive = false;
  Future<void> _showLoc() async {
    _timer = Timer.periodic(const Duration(seconds: 20), (timer) async {
      Position p = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = p;
        _isActive = true;
      });
    });
  }

  Future<void> _stopLoc() async {
    _timer?.cancel();
    setState(() {
      _currentPosition = null;
      _isActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double fem = 1.0; // Adjust this value based on your design requirements
    double ffem = 1.0; // Adjust this value based on your design requirements
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: () {
              AutService().signOut();
            },
            child: Icon(Icons.logout),
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Geographic Analisys Behavior'),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 13 * fem),
              width: double.infinity,
              height: 25 * fem,
              decoration: BoxDecoration(
                color: Color(0xffa283c0),
              ),
            ),
            Container(
              margin:
                  EdgeInsets.fromLTRB(210 * fem, 0 * fem, 0 * fem, 20 * fem),
              width: 140 * fem,
              height: 44 * fem,
              child: Stack(
                children: [
                  Positioned(
                    left: 6 * fem,
                    top: 0 * fem,
                    child: Align(
                      child: SizedBox(
                        width: 134 * fem,
                        height: 44 * fem,
                        child: Image.asset(
                          'assets/logo_gab.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 191 * fem, 0 * fem),
              child: Text(
                'Olá, Deborah!',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.2125 * ffem / fem,
                  color: Color(0x7f000000),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1 * fem,
              decoration: BoxDecoration(
                color: Color(0x33000000),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0 * fem, 53 * fem, 0 * fem, 0 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 77 * fem),
                    padding: EdgeInsets.fromLTRB(
                        28 * fem, 29 * fem, 23 * fem, 26 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xfff1e3ff),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 10 * fem),
                          constraints: BoxConstraints(
                            maxWidth: 309 * fem,
                          ),
                          child: Text(
                            'Status de Coleta Automática da Localização',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.2125 * ffem / fem,
                              color: Color(0x7f000000),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              85 * fem, 0 * fem, 80 * fem, 0 * fem),
                          width: double.infinity,
                          height: 41 * fem,
                          decoration: BoxDecoration(
                            color: _isActive ? Color(0xff2faf34) : Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              _isActive ? 'Ativo' : 'Inativo',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.2125 * ffem / fem,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        5 * fem, 0 * fem, 0 * fem, 60 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 304 * fem,
                    ),
                    child: Text(
                      'Sua localização dentro da Instituição é coletada para melhorar sua segurança e fornecer informações acadêmicas relevantes para a Coordenação Acadêmica do IFG.\n\nPara garantir sua segurança com este aplicativo, por favor, mantenha o GPS ligado e o app ativo em segundo plano!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.0001 * ffem / fem,
                        color: Color(0x7f000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 13 * fem),
                    child: Text(
                      'Termos e Condições',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w300,
                        height: 1.0001 * ffem / fem,
                        decoration: TextDecoration.underline,
                        color: Color(0x7f000000),
                        decorationColor: Color(0x7f000000),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        6 * fem, 0 * fem, 0 * fem, 13 * fem),
                    child: Text(
                      'Política de Privacidade',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w300,
                        height: 1.0001 * ffem / fem,
                        decoration: TextDecoration.underline,
                        color: Color(0x7f000000),
                        decorationColor: Color(0x7f000000),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
                    width: double.infinity,
                    height: 25 * fem,
                    decoration: BoxDecoration(
                      color: Color(0xffa283c0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
        child: const Icon(Icons.add),
      ),
    );
  }
}
