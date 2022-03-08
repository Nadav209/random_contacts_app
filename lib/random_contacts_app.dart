import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_contacts_app/presentation/pages/home_page.dart';
import 'package:random_contacts_app/presentation/pages/state_managment/home_page_provider.dart';

class RandomContactsApp extends StatelessWidget {
  const RandomContactsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<HomePageProvider>(
              create: (_) => HomePageProvider()),
        ],
        child: MaterialApp(
          title: 'RandomContactsApp',
          home: const HomePage(),
        ));
  }
}
