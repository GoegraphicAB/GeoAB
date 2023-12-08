import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  @override
  TesteScreenState createState() => TesteScreenState();
}

class TesteScreenState extends State<Teste> {
  bool _acceptTerms = false;
  bool _acceptPrivacy = false;
  String selectedCurso = 'Engenharia de Software';

  List<String> cursos = [
    'Engenharia de Software',
    'Ciência e Tecnologia de Alimentos',
    'Licenciatura em Química',
    'Sistemas de Informação',
    // Adicione outros cursos conforme necessário
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildCustomTextField('Nome Completo'),
              SizedBox(height: 16.0),
              _buildCustomTextField('Nome Social'),
              SizedBox(height: 16.0),
              _buildCustomTextField('Número de Matrícula'),
              SizedBox(height: 16.0),
              _buildCustomTextField('Email'),
              SizedBox(height: 16.0),
              _buildCustomTextField('Senha', isPassword: true),
              SizedBox(height: 16.0),
              _buildCustomDropdownField('Curso'),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: _acceptTerms,
                    onChanged: (value) {
                      setState(() {
                        _acceptTerms = value ?? false;
                      });
                    },
                  ),
                  Expanded(child:
                  Text(
                    'Li e aceito os Termos e Condições',
                    style: TextStyle(color: Colors.black),
                  ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _acceptPrivacy,
                    onChanged: (value) {
                      setState(() {
                        _acceptPrivacy = value ?? false;
                      });
                    },
                  ),
                  Expanded(child:
                  Text(
                    'Concordo com a Política de Privacidade',
                    style: TextStyle(color: Colors.black),
                  ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Adicione a lógica para processar o botão de cadastro
                  print('Botão de cadastro pressionado');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 45.0,
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Adicione a lógica para processar o botão de cadastro
                  print('Botão de cancelar pressionado');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: 45.0,
                  child: Text(
                    'Cancelar',
                    style: TextStyle(fontSize: 13.0),
                  ),
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
      height: 50.0,
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomDropdownField(String labelText) {
    return DropdownButtonFormField(
      value: selectedCurso,
      items: cursos.map((curso) {
        return DropdownMenuItem(
          value: curso,
          child: Text(curso),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedCurso = value as String;
        });
      },
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple, width: 1.0),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
