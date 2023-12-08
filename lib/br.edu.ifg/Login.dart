import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geoab/br.edu.ifg/login_overlay.dart';
import 'package:geoab/br.edu.ifg/telaCadastro.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // return Scaffold(
      // appBar: AppBar(
      // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // title: Text(widget.title),
      // ),
      home: Container(
        // primeiratelaH8Q (1:2)
        width: double.infinity,
        height: 800,
        decoration: BoxDecoration(
          color: Color(0xffa183bf),
        ),
        child: Stack(
          children: [
            Positioned(
              // botologinACC (1:4)
              left: 120,
              top: 468,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_buildLoginOverlay(context));
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0, 4),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          height: 1.2125,
                          color: Color(0x7f000000)),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // botocadastrartnQ (1:7)
              left: 120,
              top: 559,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CadastroPage(),
                  ));
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 130,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3f000000),
                        offset: Offset(0, 4),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Cadastrar',
                      style: GoogleFonts.roboto(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          height: 1.2125,
                          color: Color(0x7f000000)),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle1Amr (1:12)
              left: 0,
              top: 21,
              child: Align(
                child: SizedBox(
                  width: 360,
                  height: 14,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle2HLg (1:13)
              left: 354,
              top: 0,
              child: Align(
                child: SizedBox(
                  width: 14,
                  height: 805,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // image3QgC (3:21)
              left: 21,
              top: 288,
              child: Align(
                child: SizedBox(
                  width: 300,
                  height: 92,
                  child: Image.asset(
                    'lib/assets/logo_gab.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Route _buildLoginOverlay(BuildContext context) {
  return PageRouteBuilder(
    opaque: false,
    pageBuilder: (BuildContext context, _, __) {
  return LoginOverlay();
  },
  );
}

class CadastroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TelaCadastro();
  }
}
