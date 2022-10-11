import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class Registro extends StatefulWidget {
  Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final TextEditingController _controllerNombres = TextEditingController();
  final TextEditingController _controllerTelefono = TextEditingController();

  Future registroUsuario() async {
    String verificarLink;
    var usuarioText = _controllerNombres.text;
    var telefonoText = _controllerTelefono.text;

    if (usuarioText.isEmpty && telefonoText.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Digite la información',
          backgroundColor: Colors.orange,
          fontSize: 16.0,
          timeInSecForIosWeb: 5,
          gravity: ToastGravity.BOTTOM);
    } else {
      var url = 'http://localhost/clientes/registro.php';
      var response = await http.post(Uri.parse(url), body: {
        'nombres': usuarioText,
        'telefono': telefonoText,
      });
      var link = json.decode(json.encode(response.body));
      verificarLink = link;
      Fluttertoast.showToast(
          msg: 'Registro Exitoso',
          backgroundColor: Colors.green,
          fontSize: 16.0,
          timeInSecForIosWeb: 5,
          gravity: ToastGravity.BOTTOM);

      _controllerNombres.clear();
      _controllerTelefono.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro Usuarios'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerNombres,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Nombres",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controllerTelefono,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Telefono",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                elevation: 20,
              ),
              onPressed: () {
                registroUsuario();
              },
              child: const Text("Registrar"),
            ),
          ),
        ],
      ),
    );
  }
}
