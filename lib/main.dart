import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_contacts_app/random_contacts_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);
  runApp(const RandomContactsApp());
}
