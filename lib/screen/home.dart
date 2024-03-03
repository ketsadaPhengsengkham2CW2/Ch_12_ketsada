// ignore_for_file: implementation_imports, prefer_const_constructors, unnecessary_import, unused_import, unused_field, unnecessary_const, prefer_final_fields, unused_element, annotate_overrides

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const _methodChannel =
      const MethodChannel('platformchannel.companyname.com/deviceinfo');

  // Get device info
  String _deviceInfo = '';

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListTile(
          title: Text(
            'Device info:',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            _deviceInfo,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          contentPadding: EdgeInsets.all(16.0),
        ),
      ),
    );
  }

  Future<void> _getDeviceInfo() async {
    String deviceInfo;
    try {
      deviceInfo = await _methodChannel.invokeMethod('getDeviceInfo');
    } on PlatformException catch (e) {
      deviceInfo = "Failed to get device info: '${e.message}'.";
    }
    setState(() {
      _deviceInfo = deviceInfo;
    });
  }
}
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Your MyWidget implementation
    );
  }
}

class _homeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[900],
        title: Center(
          child: Text(
            'Platform Chanel',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: MyWidget(),
    );
  }
}
