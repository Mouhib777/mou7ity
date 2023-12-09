// import 'package:agri_vision/constant/constant.dart';
// import 'package:agri_vision/navBar/navBar.dart';
// import 'package:agri_vision/screens/additional/resetpassword.dart';

// import 'package:agri_vision/screens/registerScreen.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';
// import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/constants/constant.dart';
import 'package:flutter_application_4/screens/Auth/register.dart';
import 'package:google_fonts/google_fonts.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String? email;
  String? f_name;
  String? password;
  String? p_confirm;

  bool _obscureText = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: FadeIn(
          child: Text(
            "Mou7iti",
            style: GoogleFonts.montserratAlternates(
                color: color1,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                fontSize: 26),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Center(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            FadeInLeft(
              child: Text(
                "Let's sign in",
                style: GoogleFonts.montserratAlternates(
                    fontSize: 34, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            FadeInLeft(
              child: Text(
                "We’re waiting for you to sign in again and\nstart your journey with us",
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 40,
        ),
        FadeInUp(
          child: SizedBox(
              child: Column(children: [
            SizedBox(
              width: 330,
              child: TextField(
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.montserrat(),
                  labelStyle: GoogleFonts.montserrat(),
                  counterStyle: GoogleFonts.montserrat(),
                  hintText: 'address@mail.com',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: '  E-mail address',
                ),
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                maxLength: 40,
                onChanged: (value) {
                  email = value;
                },
                // ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 333,
              child: TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  hintStyle: GoogleFonts.montserrat(),
                  labelStyle: GoogleFonts.montserrat(),
                  counterStyle: GoogleFonts.montserrat(),
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: '  Password',
                ),
                autofocus: false,

                maxLength: 40,
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  } else {
                    setState(() {
                      password = value;
                    });
                    return null;
                  }
                },

                obscureText: _obscureText,

                // ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.of(context).push(PageRouteBuilder(
                    //     transitionDuration: Duration.zero,
                    //     pageBuilder: (context, animation, secondaryAnimation) =>
                    //         ResetPassword()));
                  },
                  child: Text(
                    "Forgot your password?",
                    style: GoogleFonts.montserrat(color: color1),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 350,
              height: 55,
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    setState(() {
                      _isLoading = true;
                    });
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email!.trim(), password: password!.trim());

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => navBar(),
                    //     ));
                  } on FirebaseAuthException catch (ex) {
                    if (ex.code == 'user-not-found') {
                      AnimatedSnackBar.material(
                        "No user found with this email",
                        type: AnimatedSnackBarType.error,
                        duration: Duration(seconds: 4),
                        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                      ).show(context);
                    } else if (ex.code == 'wrong-password') {
                      AnimatedSnackBar.material(
                        'Incorrect password',
                        type: AnimatedSnackBarType.error,
                        duration: Duration(seconds: 6),
                        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                      ).show(context);
                    } else if (ex.code == 'invalid-email') {
                      AnimatedSnackBar.material(
                        'Invalid email address',
                        type: AnimatedSnackBarType.error,
                        duration: Duration(seconds: 4),
                        mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                      ).show(context);
                    }
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    setState(() {
                      _isLoading = false;
                    });
                  }
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.montserrat(
                      fontSize: 23,
                      color: Colors.white,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: color1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(35.0)),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(child: _isLoading ? CircularProgressIndicator() : null),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No account yet?',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  child: Text(
                    "Create an account",
                    style: GoogleFonts.montserrat(
                        color: color1,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        pageBuilder: (context, animation, secondary) =>
                            registerScreen()));
                  },
                )
              ],
            ),
          ])),
        ),
        SizedBox(
          height: 30,
        ),
      ]))),
    );
  }
}
