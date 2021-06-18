import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class GoogleAndFacebookProvider extends ChangeNotifier{

  bool logOutBool = false;

  final googleSignIn = GoogleSignIn();
  final fireBase = FirebaseAuth.instance;

  GoogleSignInAccount? _googleUser;

  GoogleSignInAccount get googleUser {
    return _googleUser!;
  }

  final facebookSignIn = FacebookAuth.instance;

  Map<String, dynamic>? _facebookUser;

  Map<String, dynamic> get facebookUser {
    return _facebookUser!;
  }

  Future googleSign() async{

    final googleUser = await googleSignIn.signIn();

    if(googleUser == null){
      return;
    } else {
      _googleUser = googleUser;
    }

    final auth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: auth.idToken,
      accessToken: auth.accessToken
    );

    await fireBase.signInWithCredential(credential);
    notifyListeners();
  }

  Future facebookSign() async{
    final facebookUser = await facebookSignIn.login();

    if(facebookUser.status == LoginStatus.success) {

      _facebookUser = await facebookSignIn.getUserData();

    } else {
      return;
    }

    final credential = FacebookAuthProvider.credential(facebookUser.accessToken!.token);

    await fireBase.signInWithCredential(credential);
    notifyListeners();

  }

  Future signOut() async{
    if(logOutBool == false) {
      await googleSignIn.disconnect();
      fireBase.signOut();
      logOutBool = true;
    } else {
      await facebookSignIn.logOut();
      fireBase.signOut();
      logOutBool = false;
    }

    // fireBase.signOut();
    notifyListeners();
  }


  }















// Future facebookSignOut() async{
//   await facebookSignIn.logOut();
//   fireBase.signOut();
//   notifyListeners();
// }
