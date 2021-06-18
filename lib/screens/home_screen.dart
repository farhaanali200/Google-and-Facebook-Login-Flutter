import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'sign_in_screen.dart';
import 'logged_in_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Container(child: Center(child: CircularProgressIndicator(color: Colors.black,)));
          } else if(snapshot.hasData) {
            return LoggedInScreen();
          } else if(snapshot.hasError) {
            return Text("Error Occurred");
          } else {
            return SignInScreen();
          }
        },
      )

    );
  }
}
