import 'package:bookface/constants/strings.dart';
import 'package:bookface/routes/routes.dart';
import 'package:bookface/widgets/custom_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleUser = GoogleSignIn();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /* This boolean accounts for the state if a user has been logged in or not, might come in handy later while conditionally rendering something in the future. */
  bool isSignedIn = false;

  @override
  void initState() {
    super.initState();

    /*
      This method once initalized will listen for all the events related to googleAccount sign in, logout etc. and call the control method each time something happens.
    */

    googleUser.onCurrentUserChanged.listen((googleAccount) {
      controlLogin(googleAccount);
    }, onError: (loginError) {
      print("GOOGLE LOGIN ERROR : " + loginError.toString());
    });

    /*

      THIS BELOW METHOD WILL CHECK IF A USER HAS ALREADY BEEN LOGGED IN TO THE APP BEFORE, AND AUTOMATICALLY SKIP THE LOGIN SCREEN.

      If a PlatformException(sign_in_required, com.google.android.gms.common.api.ApiException: 4: 4: , null)) occurs, please uncheck 'Uncaught Exceptions in the Breakpoints section of the Debug SidePanel, if you're using VSCode.

      This is a known issue in google_sign_in package, if no logged in user account is found. More on that here : 
      https://github.com/flutter/flutter/issues/36041
    */

    googleUser.signInSilently(suppressErrors: true).then((googleAccount) {
      controlLogin(googleAccount);
    }).catchError((e) => print("AUTOMATIC LOGIN ERROR : " + e.toString()));
  }

  /* This below method acts as a control for every googleAccount login and will push a new route on the context. */

  void controlLogin(GoogleSignInAccount googleAccount) async {
    if (googleAccount != null) {
      setState(() {
        isSignedIn = true;
      });
      print(googleAccount.displayName + " Just Logged In");
      Navigator.of(context).pushNamed(Routes.category);
    } else {
      isSignedIn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xFF915FB5), const Color(0xFFCA436B)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(Strings.welcome,
                    style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                ),
                Text(Strings.tagline,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.only(bottom: 40),
                ),
                SignInButton(
                  Buttons.Google,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  text: Strings.google_login,
                  onPressed: () => googleUser.signIn(),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5),
                ),
                SignInButton(
                  Buttons.Facebook,
                  padding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 24),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  text: Strings.facebook_login,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(Routes.category),
                ),
              ]),
        ),
      ),
    );
  }
}
