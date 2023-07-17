import 'package:climhard_soft/UI/providers/apport2provider.dart';
import 'package:climhard_soft/UI/providers/apport3provider.dart';
import 'package:climhard_soft/UI/providers/apport4provider.dart';
import 'package:climhard_soft/UI/providers/dataproviders.dart';
import 'package:climhard_soft/application.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'UI/providers/apport5provider.dart';
import 'UI/providers/apport6provider.dart';
import 'UI/providers/apport7provider.dart';
import 'UI/providers/apport8provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DataProviderQ()),
        ChangeNotifierProvider(create: (context) => Apport2Provider()),
        ChangeNotifierProvider(create: (context) => Apport3Provider()),
        ChangeNotifierProvider(create: (context) => Apport4Provider()),
        ChangeNotifierProvider(create: (context) => Apport5Provider()),
        ChangeNotifierProvider(create: (context) => Apport6Provider()),
        ChangeNotifierProvider(create: (context) => Apport7Provider()),
        ChangeNotifierProvider(create: (context) => Apport8Provider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
        ),
        home: const Application(),
      ),
    );
  }
}
