import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/widgets/auth.dart';
import 'package:smart_guard/widgets/reconize_screen.dart';

class MyCarHealthScreen extends StatefulWidget {
  const MyCarHealthScreen({super.key});

  @override
  State<MyCarHealthScreen> createState() => _MyCarHealthScreenState();
}

class _MyCarHealthScreenState extends State<MyCarHealthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the Tab Controller
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleAppBar(title: 'My Car Health'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.px),
        child: Column(
          children: [
            SizedBox(height: 36.px),
            Container(
              height: 25.h,
              // width: MediaQuery.of(context).size.width,
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.px),
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'assets/recognize/Rectangle 442.png',
                        fit: BoxFit.cover,
                        // height: 500,
                      ),
                    ),
                    Image.asset('assets/recognize/car.png'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 39.px,
            ),
            Column(
              children: [
                TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      child: Text(
                        'Fuel Status',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.px,
                            color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Engine Status',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.px,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 217,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Your tab views go here
                      Padding(
                        padding: EdgeInsets.all(17.px),
                        child: Container(
                          height: 25.h,
                          // width: MediaQuery.of(context).size.width,
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
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.px),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.px),
                                  child: Text(
                                    textAlign: TextAlign.left,
                                    'Tank capacity:44L',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.px,
                                        color: Colors.black38),
                                  ),
                                ),
                                SizedBox(height: 15.px),
                                Image.asset(
                                  'assets/80% battery.png',
                                  height: 112,
                                ),
                                SizedBox(height: 7.px),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.px),
                                  child: Text(
                                    '80% Filled',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10.px,
                                        color: Colors.black38),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(17.px),
                        child: Container(
                          height: 25.h,
                          // width: MediaQuery.of(context).size.width,
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
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.px),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.px),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Engine Health: ',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10.px,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Good',
                                          style: GoogleFonts.poppins(
                                            fontSize: 10.px,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff18EA21),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.px),
                                Image.asset(
                                  'assets/full battery.png',
                                  height: 112,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 7.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 27.px),
              child: AccessButton(text: 'Done', ontap: (){}),
            ),
          ],
        ),
      ),
    );
  }
}
