import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:googlefacebooklogin/provider/google_and_facebook_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googlefacebooklogin/contants.dart';

class LoggedInScreen extends StatelessWidget {
  const LoggedInScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    bool cntrl =  Provider.of<GoogleAndFacebookProvider>(context).logOutBool;
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(

      backgroundColor: Color(0XFFE6E8E1),

      appBar: AppBar(
        leading: Icon(cntrl? FontAwesomeIcons.facebook : FontAwesomeIcons.google, color: Colors.white),

        backgroundColor: cntrl? blue : red,

        title: Text(cntrl? "Facebook Account Details" : "Google Account Details"
          , style: GoogleFonts.varelaRound(textStyle: TextStyle(color: Colors.white,))),
        centerTitle: true,

      ),

      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(height: 20,),

              AnimatedTextKit(
              animatedTexts: [
              TyperAnimatedText(user.displayName!, textStyle: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold, letterSpacing: 0.5))),
               ],
                pause: Duration(milliseconds: 1000),
                totalRepeatCount: 6,
              ),

            SizedBox(height: 10),

            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(user.email!, textStyle: GoogleFonts.varela(textStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold))),
              ],
              pause: Duration(milliseconds: 1000),
              totalRepeatCount: 6,
            ),

            SizedBox(height: 30),

            ElevatedButton.icon(
                onPressed: (){
                  Provider.of<GoogleAndFacebookProvider>(context, listen: false).signOut();
                },
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(150,40)),
                  backgroundColor: MaterialStateProperty.all(cntrl? blue : red),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))
                ),
                icon: Icon(cntrl? FontAwesomeIcons.facebook : FontAwesomeIcons.google),
                label: Text("Log Out", style: TextStyle(color: Colors.white, fontSize: 15))
            )
          ],
        ),
      ),
    );
  }
}
