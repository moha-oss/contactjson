import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Control/Contact.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(Datajson());
}

class Datajson extends StatelessWidget {
  String data = '';
  String data1 = '';

  Future<void> fetchData(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
          data1 = jsonData.toString();
      } else {
          data1 = 'Error: ${response.statusCode}';
      }
    } catch (error) {
        data1 = 'Error: $error';
    }
  }

  Future<String> loadAsset() async{
    return await rootBundle.loadString('asset/data.json');
  }

  Future<void> loadData() async{
    String jsonString = await loadAsset();
    var parsedJson = jsonDecode(jsonString);
    Contact contact = Contact.fromJson(parsedJson);
    data = contact.toString();
  }
  @override
  Widget build(BuildContext context) {
    loadData();
    return MaterialApp(
      title: 'Data Label Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Data Label Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Data:',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              Text(
                data,
                style: TextStyle(fontSize: 18),
              ),
              Text(
                data1,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
