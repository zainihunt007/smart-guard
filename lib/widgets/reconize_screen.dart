import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_guard/auth/signin_screen.dart';
import 'package:smart_guard/notifications/notifications.dart';
import 'package:smart_guard/recognize_section/profile_screen.dart';
import '../contact_us/contact_us.dart';
import '../driveother_automobile/otp_screen.dart';
import '../my_car/car_detail_screen.dart';
import '../passcode/issueone_time_passcode.dart';
import '../security_privacy/security_privacy.dart';

// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final double appBarHeight;
//
//   MyAppBar({Key? key, this.appBarHeight = kToolbarHeight}) : super(key: key);
//
//   final PersonalInfoController personalInfoController =
//   Get.put(PersonalInfoController());
//
//   @override
//   Widget build(BuildContext context) {
//     final personalInfo = personalInfoController.personalInfo;
//
//     log("profile pic ${personalInfo?.picUrl}");
//
//     return AppBar(
//       actions: [
//         CircleAvatar(
//           radius: 18,
//           backgroundColor: Colors.black,
//           backgroundImage: personalInfo != null &&
//               personalInfo.picUrl.isNotEmpty
//               ? NetworkImage(personalInfo.picUrl)
//               : AssetImage('assets/Ellipse 227.png') as ImageProvider,
//         ),
//         SizedBox(width: 10),
//       ],
//     );
//   }
//
//   @override
//   Size get preferredSize =>
//       Size.fromHeight(appBarHeight); // Return the desired height
// }

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});
  RxBool light = false.obs;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.px),
            bottomRight: Radius.circular(30.px)),
      ),
      width: 36.h,
      child: Padding(
        padding: EdgeInsets.only(left: 29.px, right: 17.px),
        child: Column(
          children: [
            SizedBox(height: 7.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Menu',
                  style: GoogleFonts.poppins(
                    fontSize: 13.px,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff222222),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.close,
                    color: const Color(0xff222222),
                    size: 14.px,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.px),
            DrawerTile(
                title: 'Personal Information',
                image: 'assets/drawer/Vector.png',
                ontap: () {
                  Get.back();
                  Get.to(() =>  ProfileScreen());
                }),
            SizedBox(height: 17.px),
            GestureDetector(
              onTap: () {
                Get.back();
                Get.to(() => const NotificationScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 20.px,
                    width: 20.px,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.px),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(
                            1,
                            1,
                          ), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4.5.px),
                      child: Image.asset(
                        'assets/drawer/Vector1.png',
                      ),
                    ),
                  ),
                  SizedBox(width: 10.px),
                  Text(
                    'Notification',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.px,
                      color: const Color(0xffA6A6A6),
                    ),
                  ),
                  const Spacer(),
                  Obx(
                    () => Transform.scale(
                      scale: 0.5,
                      child: Switch(
                          value: (light.value),
                          onChanged: (bool value) {
                            light.value = value;
                          }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 17.px),
            DrawerTile(
                title: 'My Car',
                image: 'assets/drawer/Vector (1).png',
                ontap: () {
                  Get.back();
                  Get.to(() => CarDetailScreen());
                }),
            SizedBox(height: 30.px),
            DrawerTile(
                title: 'Issue One-time Passcode',
                image: 'assets/drawer/Group.png',
                ontap: () {
                  Get.back();
                  Get.to(() => const IssueOneTimePasscodeScreen());
                }),
            SizedBox(height: 30.px),
            DrawerTile(
                title: 'Contact Us',
                image: 'assets/drawer/Vector (2).png',
                ontap: () {
                  Get.back();
                  Get.to(() => const ContactUsScreen());
                }),
            SizedBox(height: 30.px),
            DrawerTile(
                title: 'Security & Privacy',
                image: 'assets/drawer/Vector (3).png',
                ontap: () {
                  Get.back();
                  Get.to(() => const SecurityPrivacyScreen());
                }),
            SizedBox(height: 30.px),
            DrawerTile(
                title: 'Drive Other Automobile',
                image: 'assets/drawer/Vector (1).png',
                ontap: () {
                  Get.to(() => const DriveAutomobileOTPScreen());
                }),
            const Spacer(),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  openSignOutDialog();
                },
                child: Container(
                  height: 36.px,
                  width: 117.px,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(44.px),
                    color: const Color(0xffF32116),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/drawer/logout.png',
                        height: 20.px,
                        width: 15.px,
                      ),
                      Text(
                        'Log Out',
                        style: GoogleFonts.poppins(
                            fontSize: 14.px,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.h),
          ],
        ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback ontap;
  const DrawerTile(
      {super.key,
      required this.title,
      required this.image,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 20.px,
            width: 20.px,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.px),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(
                    1,
                    1,
                  ), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(4.5.px),
              child: Image.asset(
                image,
              ),
            ),
          ),
          SizedBox(width: 10.px),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 12.px,
              color: const Color(0xffA6A6A6),
            ),
          ),
        ],
      ),
    );
  }
}

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final String title;
  final String? subTitle;

  const TitleAppBar(
      {Key? key,
      this.appBarHeight = kToolbarHeight,
      required this.title,
      this.subTitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back_ios_rounded,
            color: Colors.black, size: 15.px),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.start,
            title,
            style: GoogleFonts.poppins(
                fontSize: 13.px,
                fontWeight: FontWeight.w500,
                color: const Color(0xff222222)),
          ),
          subTitle != null
              ? Text(
                  subTitle!,
                  style: GoogleFonts.poppins(
                    fontSize: 10.px,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff494949),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(appBarHeight); // Return the desired height
}

void openSignOutDialog() {
  Get.dialog(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.px, vertical: 28.px),
              child: Material(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 32.h),
                    Row(
                      children: [
                        Container(
                          height: 52,
                          width: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.px),
                            color: const Color(0xffF20707).withOpacity(0.2),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/Group 153.png',
                              height: 35,
                              width: 35,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.px),
                        Text(
                          'Sign Out',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.black),
                        )
                      ],
                    ),
                    SizedBox(height: 18.px),
                    Text(
                      'Are you sure you want to Sign Out?',
                      style: GoogleFonts.poppins(
                          fontSize: 12.px, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 18.px),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Get.back();
                            },
                            child: Container(
                              height: 44.px,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22.px),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(
                                      1,
                                      1,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  'No',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.px,
                                    color: const Color(0xffA0A0A0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.px),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              signOut();
                            },
                            child: Container(
                              height: 44.px,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22.px),
                                color: const Color(0xffF20707),
                              ),
                              child: Center(
                                child: Text(
                                  'Yes',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.px,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

void signOut() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final auth = FirebaseAuth.instance;
  try{
    await auth.signOut().then((value) {
      prefs.setBool('isLogin', false);
      prefs.setBool('isGoogleLogin', false);
      Get.offAll(() => SignInScreen());
    });
  }catch(e){
    print(e.toString());
  }
}
