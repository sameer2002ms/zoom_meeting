import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_meeting/resources/auth_method.dart';
import 'package:zoom_meeting/screens/Home_screen.dart';
import 'package:zoom_meeting/screens/login_screen.dart';
import 'package:zoom_meeting/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zoom Meet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/logins' : (context) => LoginScreen(),
        '/home' : (context) => HomeScreen()
      },
      home: StreamBuilder(
        stream: AuthMethods().authChange,
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData){
            return const HomeScreen();
          }
          return LoginScreen();
        },
      ),
    );
  }
}

