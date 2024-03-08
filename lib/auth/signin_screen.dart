import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_guard/auth/signup_screen.dart';
import 'package:smart_guard/recognize_section/reconize_screen.dart';
import 'package:smart_guard/validations/validation.dart';
import 'package:smart_guard/widgets/utils.dart';

import '../colors/const_colors.dart';
import '../widgets/auth.dart';

class SignInScreen extends StatelessWidget with Validations {
  SignInScreen({super.key});
  final signInController = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 29.5.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.px),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(
                          1,
                          1,
                        ), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Image.asset('assets/auth/Saly-1.png'),
                ),
              ),
              SizedBox(
                height: 14.px,
              ),
              Text(
                'Welcome Back',
                style: GoogleFonts.poppins(
                  fontSize: 24.px,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBlackText,
                ),
              ),
              Text(
                'Please Enter Your Account Details',
                style: GoogleFonts.poppins(
                  fontSize: 10.px,
                  fontWeight: FontWeight.w400,
                  color: AppColors.secondaryBlackText,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.px),
                child: Column(
                  children: [
                    SizedBox(height: 20.px),
                    // CustomTextField(
                    //   hinttext: 'Name',
                    //   image: 'assets/auth/person.png',
                    // ),
                    // SizedBox(
                    //   height: 10.px,
                    // ),
                    CustomTextField(
                      hinttext: 'Email',
                      image: 'assets/auth/email.png',
                      controller: signInController.emailController,
                    ),
                    SizedBox(
                      height: 10.px,
                    ),
                    CustomTextField(
                      hinttext: 'Password',
                      image: 'assets/auth/password.png',
                      controller: signInController.passwordController,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 6.px,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "you don't have an account?",
                          style: GoogleFonts.poppins(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(() => SignupScreen());
                          },
                          child: Text(' SignUp',style: GoogleFonts.poppins(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w500,
                            color: AppColors.appColorBlue,
                          ),),
                        ),
                      ],
                    ),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: Text(
                    //     'Forgot Password ?',
                    //     style: GoogleFonts.poppins(
                    //         fontSize: 12.px,
                    //         fontWeight: FontWeight.w500,
                    //         color: AppColors.appColorBlue),
                    //   ),
                    // ),
                    SizedBox(
                      height: 17.px,
                    ),
                    AccessButton(
                        text: 'SignIn',
                        ontap: () {
                          if (handleLoginScreenError(
                                  emailTextController:
                                      signInController.emailController,
                                  passwordTextController:
                                      signInController.passwordController)
                              .isNotEmpty) {
                            customScaffoldMessenger(
                              context,
                              handleLoginScreenError(
                                  emailTextController:
                                      signInController.emailController,
                                  passwordTextController:
                                      signInController.passwordController),
                            );
                          } else {
                            signInController.signIn(
                              context
                            );
                          }
                          // Get.to(() => const OtpVerificationScreen());
                        }),
                    SizedBox(
                      height: 25.px,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 3.px,
                          width: 100.px,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color(0xff2A9DF4),
                                Colors.white,
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7.px,
                        ),
                        Text(
                          'OR',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.px,
                            color: Color(0xff555252),
                          ),
                        ),
                        SizedBox(
                          width: 7.px,
                        ),
                        Container(
                          height: 3.px,
                          width: 100.px,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff2A9DF4),
                              Colors.white,
                            ],
                          )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 18.px,
                    ),
                    SocialAuth(
                        title: 'Continue with Google',
                        image: 'assets/auth/google.png',
                        ontap: () {
                          signInWithGoogle();
                        }),
                    SizedBox(
                      height: 10.px,
                    ),
                    SocialAuth(
                        title: 'Continue with Apple',
                        image: 'assets/auth/apple.png',
                        ontap: () {}),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void signIn(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ).then((value) {
        prefs.setBool('isLogin', true);
        Get.offAll(() => RecognizeScreen());
      });
    } on FirebaseAuthException catch (e) {
      log("Email or Password is Wrong :${e.toString()}");
      customScaffoldMessenger(context, 'Email or Password is Wrong');
    }
  }
}

class SignInModel {
  final String email;
  final String password;
  SignInModel({
    required this.email,
    required this.password,
  });
}


Future<UserCredential> signInWithGoogle() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication gAuth = await gUser!.authentication;

  final crediential = GoogleAuthProvider.credential(
    idToken: gAuth.idToken,
    accessToken: gAuth.accessToken,
  );
  try {
    final userCredential = await FirebaseAuth.instance.signInWithCredential(crediential);
    // prefs.setBool('isGoogleLogin', true);
    Get.offAll(() => RecognizeScreen());
    return userCredential;
  } catch (e) {
    throw FirebaseAuthException(message: 'Failed to sign in with Google: $e', code: '');
  }
}
// prefs.setBool('isLogin', true);
// Get.offAll(() => RecognizeScreen());
