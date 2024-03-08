import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/colors/const_colors.dart';
import 'package:smart_guard/widgets/reconize_screen.dart';

import 'car_detail_screen.dart';

class MyCarHistory extends StatelessWidget {
  MyCarHistory({super.key});
  final RxInt isExpanded = 0.obs;
  final RxBool isPress = false.obs;
  final MyCarDetailController myCarDetailController =
      Get.put(MyCarDetailController());
  // final List<Car> cars = [
  //   Car(name: "Mini Cooper", model: "S", color: "Red", year: "2021", vin: "1234567890ABCD"),
  //   Car(name: "Ford Mustang", model: "GT", color: "Blue", year: "2020", vin: "0987654321ZYXW"),
  //   Car(name: "Tesla Model S", model: "Plaid", color: "Black", year: "2022", vin: "ABCDEFGHIJKLMN"),
  //   Car(name: 'Audi A3', model: 'A3', color: 'Black', year: '2022', vin: 'ABCDEFGHIJKLMN'),
  //   // Add more cars as needed
  // ];

  @override
  Widget build(BuildContext context) {
    // log("car detail${carDetail.name}");
    myCarDetailController.fetchCarDetails();
    return Obx(
      () => Scaffold(
          appBar: const TitleAppBar(title: 'My Car History'),
          body: myCarDetailController.getCarisLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.appColorBlue,
                  ),
                )
              : ListView.builder(
                  itemCount: myCarDetailController.carDetailsList.length,
                  itemBuilder: (context, index) {
                    final carDetail =
                        myCarDetailController.carDetailsList[index];
                    if (myCarDetailController.carDetailsList.isEmpty) {
                      return const Center(child: Text("No cars added yet."));
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 23.px),
                        child: Column(
                          children: [
                            SizedBox(height: 20.px),
                            GestureDetector(
                              onTap: () {
                                isExpanded.value = index;
                                if (isPress.value == false) {
                                  isPress.value = true;
                                } else {
                                  isPress.value = false;
                                }
                              },
                              child: Obx(() => Container(
                                    // height: expandableController.isExpanded(index) ? 14.h : 44.px,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(22),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(13.px),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                carDetail.name,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.px,
                                                  color:
                                                      const Color(0xffA6A6A6),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 4.0),
                                                child: Image.asset(
                                                  'assets/downArrowIosBackOutline2.png',
                                                  width: 8,
                                                  height: 9,
                                                ),
                                              ),
                                            ],
                                          ),
                                          // The expansion state is checked for each individual item
                                          isPress.value == true &&
                                                  isExpanded.value == index
                                              ? Text(
                                                  carDetail.model,
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11.px,
                                                    color:
                                                        const Color(0xffA6A6A6),
                                                  ),
                                                )
                                              : const SizedBox.shrink(),
                                          SizedBox(height: 4.px),
                                          isPress.value == true &&
                                                  isExpanded.value == index
                                              ? Text(
                                                  carDetail.year,
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11.px,
                                                    color:
                                                        const Color(0xffA6A6A6),
                                                  ),
                                                )
                                              : const SizedBox.shrink(),
                                          isPress.value == true &&
                                                  isExpanded.value == index
                                              ? Text(
                                                  carDetail.color,
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11.px,
                                                    color:
                                                        const Color(0xffA6A6A6),
                                                  ),
                                                )
                                              : const SizedBox.shrink(),
                                          isPress.value == true &&
                                                  isExpanded.value == index
                                              ? Text(
                                                  carDetail.carNumber,
                                                  style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11.px,
                                                    color:
                                                        const Color(0xffA6A6A6),
                                                  ),
                                                )
                                              : const SizedBox.shrink(),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                )),
    );
  }
}

// class ExpandableController extends GetxController {
//   var expandedIndex = Rxn<int>(); // Rxn<int> can hold a nullable int
//
//   void toggleExpanded(int index) {
//     if (expandedIndex.value == index) {
//       // If the tapped item is already expanded, collapse it.
//       expandedIndex.value = null;
//     } else {
//       // Expand the tapped item.
//       expandedIndex.value = index;
//     }
//   }
//
//   bool isExpanded(int index) {
//     return expandedIndex.value == index;
//   }
// }

class Car {
  String name;
  String model;
  String color;
  String year;
  String vin;

  Car(
      {required this.name,
      required this.model,
      required this.color,
      required this.year,
      required this.vin});
}
