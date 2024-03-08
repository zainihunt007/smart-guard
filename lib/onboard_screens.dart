import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/colors/const_colors.dart';
import 'package:smart_guard/widgets/onboard_widgets.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      height: 8.0,
      width: isActive ? 18.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xff2A9DF4) : Color(0xff2A9DF4).withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: const BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   stops: [0.1, 0.4, 0.7, 0.9],
              //   colors: [
              //     Color(0xFF3594DD),
              //     Color(0xFF4563DB),
              //     Color(0xFF5036D5),
              //     Color(0xFF5B16D0),
              //   ],
              // ),
              // color: Colors.grey,
              ),
          child: Padding(
            padding: EdgeInsets.only(top: 22.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Container(
                //   alignment: Alignment.centerRight,
                //   child: TextButton(
                //     onPressed: () => print('Skip'),
                //     child: const Text(
                //       'Skip',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20.0,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 76.h,
                  child: PageView(
                    physics: const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0.px, right: 15.0.px, top: 15.0.px),
                            child: Container(
                              height: 53.75.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.px),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.appColorBlue.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(
                                      2,
                                      2,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  SvgPicture.asset(
                                      'assets/onboard/Group1.svg',fit: BoxFit.fill),
                                  Center(
                                    child: Image.asset(
                                        'assets/onboard/image1.png'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 24.0, right: 24.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Welcome to ',
                                    style: GoogleFonts.poppins(
                                        color: AppColors.textColorBlack,
                                        fontSize: 26.px,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                    text: 'Smart Guard ',
                                    style: GoogleFonts.poppins(
                                        color: AppColors.appColorBlue,
                                        fontSize: 26.px,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                    text: "Enhance Your Vehicle's Security",
                                    style: GoogleFonts.poppins(
                                        color: AppColors.textColorBlack,
                                        fontSize: 26.px,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0.px, right: 15.0.px, top: 15.0.px),
                            child: Container(
                              height: 53.75.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.px),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.appColorBlue.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(
                                      2,
                                      2,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  SvgPicture.asset(
                                      'assets/onboard/Group1.svg',fit: BoxFit.fill),
                                  Center(
                                    child: Image.asset(
                                        'assets/onboard/car 2.png'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 24.0, right: 24.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Keep track of your car with ',
                                    style: GoogleFonts.poppins(
                                        color: AppColors.textColorBlack,
                                        fontSize: 26.px,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                    text: 'Smart Guard ',
                                    style: GoogleFonts.poppins(
                                        color: AppColors.appColorBlue,
                                        fontSize: 26.px,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                    text: "to stay ahead of your day",
                                    style: GoogleFonts.poppins(
                                        color: AppColors.textColorBlack,
                                        fontSize: 26.px,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: 15.0.px, right: 15.0.px, top: 15.0.px),
                            child: Container(
                              height: 53.75.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.px),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.appColorBlue.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(
                                      2,
                                      2,
                                    ), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  SvgPicture.asset(
                                      'assets/onboard/Group1.svg',fit: BoxFit.fill),
                                  Center(
                                    child: Image.asset(
                                        'assets/onboard/car 3.png'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 24.0, right: 24.0),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Stay Informed, Stay Secure with ',
                                    style: GoogleFonts.poppins(
                                        color: AppColors.textColorBlack,
                                        fontSize: 26.px,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  TextSpan(
                                    text: 'Smart Guard ',
                                    style: GoogleFonts.poppins(
                                        color: AppColors.appColorBlue,
                                        fontSize: 26.px,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  // TextSpan(
                                  //   text: "to stay ahead of your day",
                                  //   style: GoogleFonts.poppins(
                                  //       color: AppColors.textColorBlack,
                                  //       fontSize: 26.px,
                                  //       fontWeight: FontWeight.w400),
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                // _currentPage != _numPages - 1
                //     ? Expanded(
                //         child: Align(
                //           alignment: FractionalOffset.bottomRight,
                //           child: GestureDetector(
                //             onTap: () {
                //               _pageController.nextPage(
                //                 duration: const Duration(milliseconds: 500),
                //                 curve: Curves.ease,
                //               );
                //             },
                //             child: const Row(
                //               mainAxisAlignment: MainAxisAlignment.center,
                //               mainAxisSize: MainAxisSize.min,
                //               children: <Widget>[
                //                 Text(
                //                   'Next',
                //                   style: TextStyle(
                //                     color: Colors.black,
                //                     fontSize: 22.0,
                //                   ),
                //                 ),
                //                 SizedBox(width: 10.0),
                //                 Icon(
                //                   Icons.arrow_forward,
                //                   color: Colors.black,
                //                   size: 30.0,
                //                 ),
                //               ],
                //             ),
                //           ),
                //         ),
                //       )
                //     : const Text(''),
                SizedBox(height: 6.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StartedButton(),
                  ],
                ),
                SizedBox(
                  height: 4.px,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign In',
                      style: GoogleFonts.quicksand(
                          color: AppColors.appColorBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.px),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      // bottomSheet: _currentPage == _numPages - 1
      //     ? Container(
      //         height: 50.0,
      //         width: double.infinity,
      //         color: Colors.white,
      //         child: GestureDetector(
      //           onTap: () => print('Get Started'),
      //           child:  Center(
      //             child: Padding(
      //               padding: EdgeInsets.only(bottom: 5.px),
      //               child: Text(
      //                 'Get Started',
      //                 style: TextStyle(
      //                   color: Color(0xFF5B16D0),
      //                   fontSize: 20.0,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       )
      //     : const Text(''),
    );
  }
}
