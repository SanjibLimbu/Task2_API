import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/view_models/posts_data.dart';
import 'package:task2/views/home_screen.dart';

void main() {
  runApp(const APITask());
}


class APITask extends StatelessWidget {
  const APITask({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=> PostsData(),
      child: MaterialApp(
    debugShowCheckedModeBanner: false,
    
    initialRoute: 'home_screen',
    routes: {
    
      'home_screen':(context) => const HomeScreen(),
    },
    
      ),
    );
  }
}



