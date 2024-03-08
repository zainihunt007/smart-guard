import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../security_privacy/security_alert.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notifications',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            fontSize: 13.px,
            color: Color(0xff222222),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.px),
        child: Column(
          children: [
            SizedBox(height: 3.8.h),
            Container(
              height: 23.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.px),
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
                  color: Colors.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.px),
                child: Column(
                  children: [
                    SizedBox(height: 10.px),
                    Row(
                      children: [
                        Image.asset(
                          'assets/New Notification.png',
                          height: 22.px,
                          width: 22.px,
                        ),
                        SizedBox(
                          width: 5.px,
                        ),
                        Text(
                          'TAG',
                          style: GoogleFonts.poppins(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA6A6A6),
                          ),
                        ),
                        Spacer(),
                        Text(
                          '1h ago',
                          style: GoogleFonts.poppins(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA6A6A6),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.px),
                    Text(
                      'security Alert',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.px,
                        color: const Color(0xff494949),
                      ),
                    ),
                    SizedBox(height: 26.px),
                    Text(
                      'Someone is Trying a force entrance in your car.',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.px,
                        color: const Color(0xff494949),
                      ),
                    ),
                    SizedBox(height: 16.px),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              Get.to(() => const SecurityAlertScreen());
                            },
                            child: Container(
                              height: 44.px,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.px),
                                color: Color(0xffEEEEEE),
                              ),
                              child: Center(
                                  child: Text(
                                'View...',
                                style: GoogleFonts.poppins(
                                    fontSize: 11.px,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff000000)),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.px),
                        Expanded(
                          child: Container(
                            height: 44.px,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.px),
                              color: Color(0xffEEEEEE),
                            ),
                            child: Center(
                                child: Text(
                              'Turn off...',
                              style: GoogleFonts.poppins(
                                  fontSize: 11.px,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff000000)),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 33.px),
            Stack(
              children: [
                Container(
                  height: 50.px,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.px),
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
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.px),
                            color: Color(0xffF0EFFF),
                          ),
                          child: Image.asset('assets/New Notification.png'),
                        ),
                        SizedBox(width: 10.px),
                        Padding(
                          padding: EdgeInsets.all(5.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Reminder',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.px,
                                  color: Color(0xff2C2C2C),
                                ),
                              ),
                              Text(
                                'Your shared One-time pin with +00 123...',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 9.px,
                                  color: Color(0xff717171),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Color(0xff584FFF),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.px),
            Stack(
              children: [
                Container(
                  height: 50.px,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.px),
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
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.px),
                            color: Color(0xffF0EFFF),
                          ),
                          child: Image.asset('assets/New Notification.png'),
                        ),
                        SizedBox(width: 10.px),
                        Padding(
                          padding: EdgeInsets.all(5.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Reminder',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.px,
                                  color: Color(0xff2C2C2C),
                                ),
                              ),
                              Text(
                                'Your shared One-time pin with +00 123...',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 9.px,
                                  color: Color(0xff717171),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 6,
                  top: 6,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Color(0xff584FFF),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.px),
            Text(
              'Yesterday',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 12.px,
                color: Color(0xff494949),
              ),
            ),
            SizedBox(height: 20.px),
            Container(
              height: 50.px,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.px),
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
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.px),
                        color: Color(0xffF0EFFF),
                      ),
                      child: Image.asset('assets/New Notification.png'),
                    ),
                    SizedBox(width: 10.px),
                    Padding(
                      padding: EdgeInsets.all(5.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reminder',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.px,
                              color: Color(0xff2C2C2C),
                            ),
                          ),
                          Text(
                            'Your shared One-time pin with +00 123...',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w300,
                              fontSize: 9.px,
                              color: Color(0xff717171),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
