import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/home.dart';
import 'extra_screen.dart';
import 'package:to_do_list/provider/todo_provider.dart';

void main(){
  runApp(MultiProvider(providers: [ChangeNotifierProvider(
      create: (_)=>TodoProvider())],
    child: const MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO DO List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      ),
      initialRoute: '/extra_screen',
      routes: {
        '/extra_screen':(context)=>ExtraScreen(),
        '/home':(context)=>HomePage(),
      },
      //home: ExtraScreen(),
    );
  }
}
