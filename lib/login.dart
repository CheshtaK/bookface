import 'package:bookface/constants/strings.dart';
import 'package:bookface/routes/routes.dart';
import 'package:bookface/widgets/login_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'constants/images.dart';
import 'splash.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          /*

          @abhinavsri360 actually did a pretty good job in implementing,
          the FadeIn Animation widget in the splash screen, I've imported the same Widget here
          for now.

          It might be good if that function can be separated into helpers or widget in
          the later future.


          This First Flexible Widget Contains The Hero Image
          For The Login Screen, which can be found/changed at
          
          assets/images/login-hero.png      
          */

          Flexible(
            child: FadeIn(
              1.0,
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.loginHero),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
            ),
          ),

          /*
          This Second Flexible Widget Contains The Hero Text
          And The Different Login Buttons      
          */

          Flexible(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  FadeIn(
                    1.25,
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 30),
                      child: Text(
                        Strings.loginHero,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: Color(0xffDB665E),
                            fontSize: 42),
                      ),
                    ),
                  ),
                  FadeIn(
                    1.5,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 40),
                        ),
                        LoginButton(
                          onPress: () => googleUser.signIn(),
                          accentColor: Color(0xffc03a2b),
                          icon: FontAwesomeIcons.google,
                          text: Strings.google_login,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        Text(
                          'or',
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontFamily: 'Poppins',
                              fontSize: 14),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                        ),
                        LoginButton(
                          onPress: () =>
                              Navigator.of(context).pushNamed(Routes.category),
                          accentColor: Color(0xff005f9a),
                          icon: FontAwesomeIcons.facebookF,
                          text: Strings.facebook_login,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
