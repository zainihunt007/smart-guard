import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/auth/signin_screen.dart';
import 'package:smart_guard/colors/const_colors.dart';
import 'package:smart_guard/validations/validation.dart';

import '../widgets/auth.dart';
import '../widgets/utils.dart';
import 'otp_verification_Screen.dart';

class SignupScreen extends StatelessWidget with Validations {
  SignupScreen({super.key});
  final signupController = Get.put(SignUpController());

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
                'Welcome',
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
                    CustomTextField(
                      hinttext: 'Name',
                      image: 'assets/auth/person.png',
                      controller: signupController.nameController,
                    ),
                    SizedBox(
                      height: 10.px,
                    ),
                    CustomTextField(
                      hinttext: 'Email',
                      image: 'assets/auth/email.png',
                      controller: signupController.emailController,
                    ),
                    SizedBox(
                      height: 10.px,
                    ),
                    CustomTextField(
                      hinttext: 'Password',
                      image: 'assets/auth/password.png',
                      controller: signupController.passwordController,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 10.px,
                    ),
                    CustomTextField(
                      hinttext: 'License no.',
                      image: 'assets/auth/license.png',
                      controller: signupController.licenseNumberController,
                      keyboardTypePhone: true,
                    ),
                    SizedBox(
                      height: 6.px,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Already have an account?',
                          style: GoogleFonts.poppins(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.to(() => SignInScreen());
                          },
                          child: Text(' SignIn',style: GoogleFonts.poppins(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w500,
                            color: AppColors.appColorBlue,
                          ),),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.px,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      GestureDetector(
                        onTap: (){
                          Get.to(() => const OtpVerificationScreen());
                        },
                        child: Text(
                          ' Forgot Password?',style: GoogleFonts.poppins(
                          fontSize: 12.px,
                          fontWeight: FontWeight.w500,
                          color: AppColors.appColorBlue,
                        ),),
                      ),
                    ],),
                    SizedBox(
                      height: 17.px,
                    ),
                    AccessButton(
                        text: 'Signup',
                        ontap: () {
                          // Get.to(() => SigninScreen());
                          if (handleSingUpScreenError(
                            emailTextController:
                                signupController.emailController,
                            passwordTextController:
                                signupController.passwordController,
                            nameTextController: signupController.nameController,
                            licenseNumberController:
                                signupController.licenseNumberController,
                          ).isNotEmpty) {
                            customScaffoldMessenger(
                              context,
                              handleSingUpScreenError(
                                emailTextController:
                                    signupController.emailController,
                                passwordTextController:
                                    signupController.passwordController,
                                nameTextController:
                                    signupController.nameController,
                                licenseNumberController:
                                    signupController.licenseNumberController,
                              ),
                            );
                          } else {
                            signupController
                                .signUp(
                              SignUpModel(
                                email: signupController.emailController.text,
                                password:
                                    signupController.passwordController.text,
                              ),
                              UserModel(
                                name: signupController.nameController.text,
                                licenseNumber: signupController
                                    .licenseNumberController.text,
                                gender: 'Gender',
                                phone: '+12345678',
                                profilePic: '',
                              ),
                            )
                                .then((value) {
                              Get.to(() => SignInScreen());
                            });
                          }
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
                          )),
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
                        ontap: () {}),
                    SizedBox(
                      height: 10.px,
                    ),
                    SocialAuth(
                        title: 'Continue with Apple',
                        image: 'assets/auth/apple.png',
                        ontap: () {}),
                    SizedBox(height: 18.px),
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

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser?.uid;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController licenseNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signUp(SignUpModel signUpModel, UserModel userModel) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: signUpModel.email,
        password: signUpModel.password,
      );

      UserModel data = UserModel(
        // Generate unique ID
        name: nameController.text,
        licenseNumber: licenseNumberController.text,
        profilePic: '',
        phone: '+12345678',
        gender: 'Gender',
      );

      FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set(data.toMap());

      // You can also use Get.toNamed() to navigate to another page after signup
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}

class SignUpModel {
  final String email;
  final String password;

  SignUpModel({
    required this.email,
    required this.password,
  });
}

class UserModel {
  final String name;
  final String licenseNumber;
  final String phone;
  final String gender;
  final String profilePic;

  UserModel({
    required this.name,
    required this.licenseNumber,
    required this.gender,
    required this.phone,
    required this.profilePic,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'licenseNumber': licenseNumber,
      'gender': 'gender',
      'phone': 'phone',
      'profilePic': '',
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      licenseNumber: map['licenseNumber'],
      gender: map['gender'],
      phone: map['phone'],
      profilePic: map['profilePic'],
    );
  }
}






// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:smart_guard/auth/signin_screen.dart';
// import 'package:smart_guard/colors/const_colors.dart';
// import 'package:smart_guard/validations/validation.dart';
//
// import '../widgets/auth.dart';
// import '../widgets/utils.dart';
//
// class SignupScreen extends StatelessWidget with Validations {
//   SignupScreen({super.key});
//   final signupController = Get.put(SignUpController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   height: 29.5.h,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15.px),
//                     color: Colors.white,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         spreadRadius: 1,
//                         blurRadius: 4,
//                         offset: Offset(
//                           1,
//                           1,
//                         ), // changes position of shadow
//                       ),
//                     ],
//                   ),
//                   child: Image.asset('assets/auth/Saly-1.png'),
//                 ),
//               ),
//               SizedBox(
//                 height: 14.px,
//               ),
//               Text(
//                 'Welcome',
//                 style: GoogleFonts.poppins(
//                   fontSize: 24.px,
//                   fontWeight: FontWeight.w500,
//                   color: AppColors.primaryBlackText,
//                 ),
//               ),
//               Text(
//                 'Please Enter Your Account Details',
//                 style: GoogleFonts.poppins(
//                   fontSize: 10.px,
//                   fontWeight: FontWeight.w400,
//                   color: AppColors.secondaryBlackText,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 25.px),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 20.px),
//                     CustomTextField(
//                       hinttext: 'Name',
//                       image: 'assets/auth/person.png',
//                       controller: signupController.nameController,
//                     ),
//                     SizedBox(
//                       height: 10.px,
//                     ),
//                     CustomTextField(
//                       hinttext: 'Email',
//                       image: 'assets/auth/email.png',
//                       controller: signupController.emailController,
//                     ),
//                     SizedBox(
//                       height: 10.px,
//                     ),
//                     CustomTextField(
//                       hinttext: 'Password',
//                       image: 'assets/auth/password.png',
//                       controller: signupController.passwordController,
//                       obscureText: true,
//                     ),
//                     SizedBox(
//                       height: 10.px,
//                     ),
//                     CustomTextField(
//                       hinttext: 'License no.',
//                       image: 'assets/auth/license.png',
//                       controller: signupController.licenseNumberController,
//                       keyboardTypePhone: true,
//                     ),
//                     SizedBox(
//                       height: 4.px,
//                     ),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: GestureDetector(
//                         onTap: (){
//                           Get.to(() => SignInScreen());
//                         },
//                         child: Text(
//                           'Forgot Password ?',
//                           style: GoogleFonts.poppins(
//                               fontSize: 12.px,
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.appColorBlue),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 17.px,
//                     ),
//                     AccessButton(
//                         text: 'Signup',
//                         ontap: () {
//                           // Get.to(() => SigninScreen());
//                           if (handleSingUpScreenError(
//                             emailTextController:
//                             signupController.emailController,
//                             passwordTextController:
//                             signupController.passwordController,
//                             nameTextController: signupController.nameController,
//                             licenseNumberController:
//                             signupController.licenseNumberController,
//                           ).isNotEmpty) {
//                             customScaffoldMessenger(
//                               context,
//                               handleSingUpScreenError(
//                                 emailTextController:
//                                 signupController.emailController,
//                                 passwordTextController:
//                                 signupController.passwordController,
//                                 nameTextController:
//                                 signupController.nameController,
//                                 licenseNumberController:
//                                 signupController.licenseNumberController,
//                               ),
//                             );
//                           } else {
//                             signupController
//                                 .signUp(
//                               SignUpModel(
//                                 email: signupController.emailController.text,
//                                 password:
//                                 signupController.passwordController.text,
//                               ),
//                               UserModel(
//                                 name: signupController.nameController.text,
//                                 licenseNumber: signupController
//                                     .licenseNumberController.text,
//                               ),
//                             )
//                                 .then((value) {
//                               Get.to(() =>  SignInScreen());
//                             });
//                           }
//                         }),
//                     SizedBox(
//                       height: 25.px,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           height: 3.px,
//                           width: 100.px,
//                           decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.centerRight,
//                                 end: Alignment.centerLeft,
//                                 colors: [
//                                   Color(0xff2A9DF4),
//                                   Colors.white,
//                                 ],
//                               )),
//                         ),
//                         SizedBox(
//                           width: 7.px,
//                         ),
//                         Text(
//                           'OR',
//                           style: GoogleFonts.poppins(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 12.px,
//                             color: Color(0xff555252),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 7.px,
//                         ),
//                         Container(
//                           height: 3.px,
//                           width: 100.px,
//                           decoration: const BoxDecoration(
//                               gradient: LinearGradient(
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                                 colors: [
//                                   Color(0xff2A9DF4),
//                                   Colors.white,
//                                 ],
//                               )),
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 18.px,
//                     ),
//                     SocialAuth(
//                         title: 'Continue with Google',
//                         image: 'assets/auth/google.png',
//                         ontap: () {}),
//                     SizedBox(
//                       height: 10.px,
//                     ),
//                     SocialAuth(
//                         title: 'Continue with Apple',
//                         image: 'assets/auth/apple.png',
//                         ontap: () {}),
//                     SizedBox(height: 18.px),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SignUpController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController licenseNumberController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   Future<void> signUp(SignUpModel signUpModel,
//       UserModel userModel) async {
//     try {
//       final credential = await _auth.createUserWithEmailAndPassword(
//         email: signUpModel.email,
//         password: signUpModel.password,
//       );
//
//       UserModel data = UserModel(
//         // Generate unique ID
//         name: nameController.text,
//         licenseNumber: licenseNumberController.text,
//       );
//
//       FirebaseFirestore.instance
//           .collection('users')
//           .doc(credential.user!.uid)
//           .set(data.toMap());
//
//       // You can also use Get.toNamed() to navigate to another page after signup
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }

// class SignUpModel {
//   final String email;
//   final String password;
//
//   SignUpModel({
//     required this.email,
//     required this.password,
//   });
// }
//
// class UserModel {
//   final String name;
//   final String licenseNumber;
//
//   UserModel({
//     required this.name,
//     required this.licenseNumber,
//   });
//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'licenseNumber': licenseNumber,
//     };
//   }
//
//   factory UserModel.fromMap(Map<String, dynamic> map) {
//     return UserModel(
//       name: map['name'],
//       licenseNumber: map['licenseNumber'],
//     );
//   }
// }

