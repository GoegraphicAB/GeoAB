import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class LocationGEO{
  String id;
  String latitude;
  String longitude;
  String altitude;
  String timestamp;

  LocationGEO({required this.id, required this.longitude, required this.latitude, required this.altitude,required this.timestamp});

  UpdateLocation() async {
    String idDoc = const Uuid().v4();
    print("AQUI");
    var response = await http.post(
        Uri.parse('https://firestore.googleapis.com/v1/projects/geoab-779d7/databases/(default)/documents/dadosAlunos?documentId=${idDoc}&access_token=\\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCxA6FDMBP+PlfR\\nmJsGFlXsZs9oswGXrYgs+K0FDnSRh2aC06PaoMegCS3aDsXzXAI2nVJAJKqCrb/l\\nnYiWkXcN6mZqYgo+HSR52mieGFFokgEsNNvMlJlewhkNKl7stC7pivab+EAPqXIM\\npxa60cEJAzUOmGVDm/qZf+/eMntYYZ4BNsCARrl9UHQ9Jdryx8u6+MwL/b8sHe6R\\nfbE/qrNU1fGWcWwhlSABpOoil9W5ab/XlvOYoToi5qDWGgomGOax9dZMNscH90FV\\nfImd8BFqFpHTnJIBd1LgD/VfqByllH0nwNZEIBxWvuxEQ3Mw9jjz7D0Sbn2VWGvX\\nE3WsEuVPAgMBAAECggEADgM/jNYNfx7oTMtL2luCSciJurwQ8DTohsbYy4GtcKfL\\nUaf3XKNFqkGPw6dPvEgYVMJ3dGRyqw2eF0s1ONYjGpLnsJw6O1iLPqovhfRe3WxR\\nc3Jrw/IvgfTTjts/0HUjEZHSm943FAZR5PaFMhzQryn11UXzHjsGx4f9MRXF9eUC\\npkQ9Itq7pkhks4olxWCNRLlBMbIpO18pn1l23/84kjhtPKMCF/UCumSkq14ZrGox\\nhqopn3KJf/WK8YUHp8fHOKyaIAwrsTZE6IFJqtT3jLDDbZfc04NuTBnR+OGEYA+O\\ni7hJ9bp0p336fFjqbz3zI5EEigj2EeIwfQntLtf7IQKBgQDdcB4G0U4dDSV5GoQk\\nxU7H4RjGZlHAWxH7Lj/DyaD4WZq7LLoSI1IFnRIhHtQCFARuuWqKSCg2QOpe9B7g\\nFWJWYh/YUXwqonjr6uDKfRXInlcTZ+k9Uqlsqjo6bmCoIQiF6UbS2wI7aO3kNGmR\\nqvSgxD5VicjSY4qBglXmIMB4IwKBgQDMpH6aJcyrY4iWrELnvjvk/0CklrPxhD84\\nWKDm4B/PCvjrjdMMFGmoI90+Qc1yaWY1PsGdikv3UyFrLl4wvHXfcDb213t2bnni\\n/1LOhJijHQ1z1+YilFfHDC6lS4Gerc1d6qXyI55zrrkNFDkT2OLiIN5ByFON15bt\\nVGyGn8q65QKBgQC+hY+gKAfAYSZDuzfE92pf+WE6mqBuEy02Y0WDrABujZHex43U\\nu0UABXOqwX6Bxz1FEw0CqzDF9TZxujKydFOmpUhm8z0U5bOKsAz2y4aplOqwjLAW\\nDgAtuYzd50gMgFd3+AzysHKMMSy1Mw89wMw3YoGLUUBTHEf4Q+6qULWo5wKBgQCH\\n5LQtqOxA49fQNpQ3UBx19Qr4QRs9RpS01iYDKtH0q1ShF40OeH+xKB/DN+82CsfU\\nk9f+xdesZYfLpP7nXj7oIZxeTrmt668FDofunB7AMoq8YqJwVBH2HCDdo0ZwGPpH\\nY4rPQNf3+g7ooIVGqMABadIt3NmfV4riDy4COBpoAQKBgF8FuLHAkuDBcpNl3ntm\\ni90dOUSCy2o4ujx1RQljVA4503k2URAvqdFPWDshvCPjShY6AYTiP04Fm/yLsZL/\\nNJmGmA+BxlrEgA1xPLbowApIDi1AE/2piXuIIl8yFU8abolx0EfzKI6IVY8Dscb5\\nE4X1VQ+fN6xKl0WXJiCid9Z6\\n'),
        headers: <String, String>{
    'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'fields': <String, dynamic>{
            "id": <String, dynamic>{"stringValue": this.id},
            "latitude": <String, dynamic>{"stringValue": this.latitude},
            "longitude": <String, dynamic>{"stringValue": this.longitude},
            "altitude": <String, dynamic>{"stringValue": this.altitude},
            "timestamp": <String, dynamic>{"stringValue": this.timestamp},
          },
        })
    );
    var ret = utf8.decode(response.bodyBytes);
    print("tese");
    //Firebase.initializeApp();
    //CollectionReference dadosAlunos = FirebaseFirestore.instance.collection('dadosAlunos');

    //dadosAlunos.add({'id':this.id, 'latitude':this.latitude, 'longitude':this.longitude, 'altitude':this.altitude})
      //  .then((value) => print(value)).catchError((value) => print(value));
  }
}
