import 'package:flutter/material.dart';
import 'package:zoom_meeting/resources/auth_method.dart';

import '../Widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Start or join the meeting',
              style: const TextStyle(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Image.asset('assets/onboarding.jpg'),
            ),
            CustomButton(
              text: 'Google Sign in',
              onPressed: () async {
                bool res = await _authMethods.signInWithGoogle(context);
                if(res){
                  Navigator.pushNamed(context, '/home');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
