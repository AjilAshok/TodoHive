import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:provider/provider.dart';
import 'package:todomodelhive/logic/contact_notifer.dart';
import 'package:todomodelhive/model/contactmodel.dart';

import 'package:todomodelhive/screens/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocmentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocmentDirectory.path);

  Hive.registerAdapter(ContactModelAdapter());
  Hive.isBoxOpen('contacts')
      ? Hive.box('contacts')
      : await Hive.openBox('contacts');
  runApp(const MyApp());
  // await Hive.openBox('contacts');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContactNotifer(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
