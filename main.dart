import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/home.dart';
import 'Provider/ToDoProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => todoP(),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home : Home() ,
      theme: ThemeData(
          useMaterial3: true
       ),

    );


}
}
