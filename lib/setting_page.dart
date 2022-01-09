import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';

class setting extends StatelessWidget {
  const setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
          ),
        ),
        body: Center(
            child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                AppSettings.openDeviceSettings();
              },
              child: Text("Device Setting"),
            ),
            ElevatedButton(
              onPressed: () {
                AppSettings.openBluetoothSettings();
              },
              child: Text("Bluetooth Setting"),
            )
          ],
        )));
  }
}
