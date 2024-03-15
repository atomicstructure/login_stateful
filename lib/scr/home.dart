import 'package:flutter/material.dart';
import 'package:login_stateful/screens/login_screen.dart';
import '../scr/blocs/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login',
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            elevation: 0.0,
            title: const Text('Login', style: TextStyle(color: Colors.white)),
          ),
          body: const LoginScreen(),
        ),
      ),
    );
  }
}
