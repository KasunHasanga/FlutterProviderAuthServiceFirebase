import 'package:firebase_user_avatar_flutter/app/home/home_page.dart';
import 'package:firebase_user_avatar_flutter/app/sign_in/sign_in_page.dart';
import 'package:firebase_user_avatar_flutter/services/firebase_auth_service.dart';
import 'package:flutter/material.dart';

///Builds the signed-in or non-signed in UI,depending on the user Snapshots.
///This widget below the [MaterialApp]
///an [AuthWidgetBuilder] ancestor is require for this widget to work
class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key, @required this.userSnapshots}) : super(key: key);
  final AsyncSnapshot<User> userSnapshots;

  @override
  Widget build(BuildContext context) {
    if (userSnapshots.connectionState == ConnectionState.active) {
      return userSnapshots.hasData ? HomePage() : SignInPage();
    }
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
