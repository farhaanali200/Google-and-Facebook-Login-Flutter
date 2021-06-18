import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class SignInButtonWidget extends StatelessWidget {

  final Buttons? buttonType;
  final Function? onPress;
  final double? pad;

  SignInButtonWidget({@required this.buttonType, @required this.onPress, @required this.pad});

  @override
  Widget build(BuildContext context) {
    return SignInButton(
        buttonType!,
        padding: EdgeInsets.all(pad!),
        elevation: 4,
        onPressed: onPress!
    );
  }
}