import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geoab/br.edu.ifg/controller/AutService.dart';
import 'package:geoab/br.edu.ifg/telaCadastro.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<TelaCadastro> {
  Position? _currentPosition;
  Timer? _timer;
  bool _isActive = false;

  Future<void> _initService() async {
    Map<Permission, PermissionStatus> statuses =
    await [Permission.location, Permission.locationAlways].request();
    if (await Permission.locationAlways.isGranted) {
      FlutterBackgroundService().startService();
    }
  }

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

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  String buttonText = 'Data'; // Texto inicial do botão "Data"

  String selectedMateria = 'Selecione uma matéria'; // Valor inicial da matéria selecionada

  List<String> materias = [
    'Fábrica de Software',
    'Pesquisa e Inovação',
    'Ética',
    'Governança',
    'Sistemas Distribuídos',
    'Experiência do Usuário',
  ];

  @override
  Widget build(BuildContext context) {
    double fem = 1.0; // Ajuste esse valor conforme necessário
    double ffem = 1.0; // Ajuste esse valor conforme necessário

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
        backgroundColor: Color.fromRGBO(210, 187, 255, 1),
        title: Text('Geographic Analysis Behavior'),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 0 * fem, 13 * fem),
                  width: double.infinity,
                  height: 15 * fem,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(210, 187, 255, 1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      210 * fem, 0 * fem, 0 * fem, 20 * fem),
                  width: 140 * fem,
                  height: 44 * fem,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 6 * fem,
                        top: 7 * fem,
                        child: Align(
                          child: SizedBox(
                            width: 134 * fem,
                            height: 44 * fem,
                            child: Image.asset(
                              'lib/assets/inferno.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0 * fem, 0 * fem, 191 * fem, 10 * fem),
                  child: Text(
                    'Meus Relatorios!',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20 * ffem,
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

                // Adicione os botões abaixo da linha "Meus Relatórios"
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15 * fem),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Adicione a lógica desejada para o botão "Data"
                          _showDatePicker(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(210, 187, 255, 1), // Cor roxa
                        ),
                        child: Text(
                            buttonText), // Utiliza o valor da variável buttonText
                      ),

                      ElevatedButton(
                        onPressed: () {
                          // Adicione a lógica desejada para o botão "Materias"
                          print("Botão Materias pressionado");
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(210, 187, 255, 1), // Cor roxa
                        ),
                        child: Text('Materias'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Adicione a lógica desejada para o botão "Locais"
                          print("Botão Locais pressionado");
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(210, 187, 255, 1), // Cor roxa
                        ),
                        child: Text('Locais'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 270,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.asset(
                'lib/assets/grafico1.jpg', // Substitua com o caminho correto para a sua imagem
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Container roxo no topo
          Positioned(
            bottom: 100,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Image.asset(
                'lib/assets/grafico2.jpeg', // Substitua com o caminho correto para a sua imagem
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Container roxo no topo
          Positioned(
            top: 750,
            left: 0,
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 30 * fem, // ou a altura desejada
              color: Color.fromRGBO(210, 187, 255, 1),
            ),
          ),
        ],
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

  Future<void> _showDatePicker(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _focusedDay,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _focusedDay) {
      setState(() {
        _selectedDay = pickedDate;
        buttonText = _selectedDay!.toLocal().toString().split(
            ' ')[0]; // Atualiza o texto do botão com a data selecionada
      });
    }
  }

}
