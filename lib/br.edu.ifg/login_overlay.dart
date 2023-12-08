// login_overlay.dart
import 'package:flutter/material.dart';
import 'package:geoab/br.edu.ifg/controller/AutService.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginOverlay extends StatefulWidget {
  @override
  _LoginOverlayState createState() => _LoginOverlayState();
}

class _LoginOverlayState extends State<LoginOverlay> {
  bool _rememberMe = false;
  String? email;
  String? senha;
  TextEditingController textControllerEmail = TextEditingController();
  TextEditingController textControllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final mediaQuery = MediaQuery.of(context);
    return Material(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0.0),
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: Color(0xffa183bf),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCustomTextField('Email'),
              SizedBox(height: 16.0),
              _buildCustomTextField('Senha', isPassword: true),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                  ),
                  Text(
                    'Lembrar identificação',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: () {
                  // Adicione a lógica para processar o link "Esqueci minha senha"
                  print('Esqueci minha senha');
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Esqueci minha senha',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 48.0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: MaterialButton(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onPrimary
                            ),
                          ),
                        ),
                          color: Color.fromRGBO(76, 175, 76, 1),
                          elevation: 3,
                          minWidth: mediaQuery.size.width * 0.8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),

                          onPressed: (){
                            AutService().signInWithEmailAndPassword(textControllerEmail.text, textControllerSenha.text)
                                .whenComplete(() => Navigator.pop(context));
                          }
                      ),
                    )
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTextField(String labelText, {bool isPassword = false}) {
    return SizedBox(
      height: 50.0, // Ajuste este valor conforme necessário
      child: TextField(
        obscureText: isPassword,
        controller: (isPassword ? textControllerSenha : textControllerEmail),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xffa183bf)),
          filled: true,             // Preencher o campo
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}



