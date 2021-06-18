import 'package:flutter/material.dart';
import 'package:googlefacebooklogin/provider/google_and_facebook_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:googlefacebooklogin/contants.dart';
import 'package:googlefacebooklogin/components/sign_in_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("images/google.png"),
                  height: 150,
                  width: 150,
                ),
                Image(
                  image: AssetImage("images/facebook.png"),
                  height: 150,
                  width: 150,
                ),
              ],
            ),
            SizedBox(height: 80),

            SignInButtonWidget(buttonType: Buttons.Google, onPress: () {
              Provider.of<GoogleAndFacebookProvider>(context, listen: false).googleSign();
            },
            pad: 3
            ),

            SizedBox(height: 20),

            SignInButtonWidget(buttonType: Buttons.Facebook, onPress: (){
              Provider.of<GoogleAndFacebookProvider>(context, listen: false).facebookSign();
            },
            pad: 6
            )
          ],
        ),
      ),
    );
  }
}

