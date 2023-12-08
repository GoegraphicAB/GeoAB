import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:geoab/br.edu.ifg/mapa.dart';
import 'package:geoab/br.edu.ifg/Login.dart';

class AutGateway extends StatelessWidget {
  const AutGateway({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoginPage();
        }
        return MyHomePage();
      },
    );
  }
}
