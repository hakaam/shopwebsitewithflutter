import 'package:flutter/material.dart';
import 'package:shopwebsitewithflutter/whole_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/scroll_ofset.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  BlocProvider(
          create: (_) => DisplayOffset(ScrollOffset(scrollOfsetValue: 0)),

          child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

      ),
      body:WholePage()
    );
  }
}
