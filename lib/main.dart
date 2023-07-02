import 'package:betweener/providers/connectivity_provider.dart';
import 'package:betweener/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyConnectivity>(
          create: (_) => MyConnectivity(),
        ),
      ],
      child: MaterialApp(
        title: 'Betweener',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Betweener'),
      ),
    );
  }
}
