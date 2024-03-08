import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/colors/const_colors.dart';
import 'package:smart_guard/validations/validation.dart';
import 'package:smart_guard/widgets/auth.dart';
import 'package:smart_guard/widgets/reconize_screen.dart';

import '../widgets/utils.dart';
import 'mycar_health.dart';
import 'mycar_history.dart';

class CarDetailScreen extends StatelessWidget with Validations {
  CarDetailScreen({super.key});
  MyCarDetailController myCarDetailController =
      Get.put(MyCarDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        title: 'My Car',
        subTitle: 'Enter your car details',
      ),
      body: Obx(() => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.px),
          child: SingleChildScrollView(
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Change Image',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.px,
                                  color: Color(0xff2A9DF4),
                                ),
                              ),
                              SizedBox(width: 2.px),
                              Image.asset(
                                'assets/Vector.png',
                                height: 12,
                                width: 14,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2.2.h),
                CustomTextField(
                  image: 'assets/drawer/Vector (1).png',
                  hinttext: 'Mini Cooper gp',
                  controller: myCarDetailController.nameController,
                ),
                SizedBox(height: 2.2.h),
                CustomTextField(
                  image: 'assets/drawer/Vector (1).png',
                  hinttext: 'BD51 SMR',
                  controller: myCarDetailController.modelController,
                ),
                SizedBox(height: 2.2.h),
                CustomTextField(
                  image: 'assets/drawer/Vector (1).png',
                  hinttext: '2021',
                  keyboardTypePhone: true,
                  controller: myCarDetailController.yearController,
                ),
                SizedBox(height: 2.2.h),
                CustomTextField(
                  image: 'assets/drawer/Vector (1).png',
                  hinttext: 'Black',
                  controller: myCarDetailController.colorController,
                ),
                SizedBox(height: 2.2.h),
                CustomTextField(
                  image: 'assets/drawer/Vector (1).png',
                  hinttext: 'abcd1233214ab4cd',
                  controller: myCarDetailController.carNumberController,
                ),
                SizedBox(height: 2.2.h),
                CustomTextField(
                    image: 'assets/drawer/Vector (1).png',
                    hinttext: 'Car Health',
                    sfxImage: 'assets/evaArrowIosBackOutline2.png',
                    readOnly: true,
                    ontap: () {
                      Get.to(() => const MyCarHealthScreen());
                    }),
                SizedBox(height: 2.2.h),
                CustomTextField(
                    image: 'assets/drawer/Vector (1).png',
                    hinttext: 'My Car History',
                    sfxImage: 'assets/evaArrowIosBackOutline2.png',
                    readOnly: true,
                    ontap: () {
                      Get.to(() => MyCarHistory());
                    }),
                SizedBox(height: 2.2.h),
                myCarDetailController.addCarisLoading.value ? const Center(child: CircularProgressIndicator(color: AppColors.appColorBlue,),) : AccessButton(text: 'Done', ontap: () {
                  if(handleCarDetailScreenError(
                    nameTextController: myCarDetailController.nameController,
                    modelTextController: myCarDetailController.modelController,
                    yearTextController: myCarDetailController.yearController,
                    colorTextController: myCarDetailController.colorController,
                    carNumberTextController: myCarDetailController.carNumberController,
                  ).isNotEmpty){
                    customScaffoldMessenger(context, handleCarDetailScreenError(
                      nameTextController: myCarDetailController.nameController,
                      modelTextController: myCarDetailController.modelController,
                      yearTextController: myCarDetailController.yearController,
                      colorTextController: myCarDetailController.colorController,
                      carNumberTextController: myCarDetailController.carNumberController,
                    ));
                  }else{
                    myCarDetailController.addCarDetails().then((value) {
                      customScaffoldMessenger(context, 'New Car is added');
                    }).onError((error, stackTrace) {
                      customScaffoldMessenger(context, "error adding a car: ${error.toString()}");
                    });
                  }
                }),
                SizedBox(height: 5.2.h),
              ],
            ),
          ),
        ),
      ),),
    );
  }
}

class MyCarDetail {
  final String name;
  final String model;
  final String year;
  final String color; // Add this line
  final String carNumber; // Add this line
  final String carPic;

  MyCarDetail({
    required this.name,
    required this.model,
    required this.year,
    required this.color,
    required this.carNumber,
    this.carPic = '', // Initialize with an empty string or a default image URL
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'model': model,
      'year': year,
      'color': color, // Add this line
      'carNumber': carNumber,
      'carPic': carPic,
    };
  }

  factory MyCarDetail.fromMap(Map<String, dynamic> map) {
    return MyCarDetail(
      name: map['name'],
      model: map['model'],
      year: map['year'],
      color: map['color'],
      carNumber: map['carNumber'],
      carPic: map['carPic'] ??
          '', // Add this line, with a fallback to an empty string
    );
  }
}

class MyCarDetailController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController carNumberController = TextEditingController();

  RxBool getCarisLoading = false.obs;
  RxBool addCarisLoading = false.obs;
  var carDetailsList = <MyCarDetail>[].obs;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser?.uid;

  Future<void> addCarDetails() async {
    addCarisLoading.value = true;
    try{
      MyCarDetail carDetail = MyCarDetail(
        name: nameController.text.tr,
          model: modelController.text.tr,
          year: yearController.text.tr,
          color: colorController.text.tr,
          carNumber: carNumberController.text.tr,
        carPic: '',
      );
      Map<String, dynamic> carDetailMap = carDetail.toMap();
      DocumentReference userDocRef = FirebaseFirestore.instance.collection('MyCars').doc(currentUser);
      await userDocRef.set({
        'carDetails': FieldValue.arrayUnion([carDetailMap])
      }, SetOptions(merge: true)).then((value) {
        log('added successfully');
      });
    }catch(e){
      print(e.toString());
    } finally{
      addCarisLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchCarDetails(); // Fetch car details when the controller is initialized
  }

  Future<void> fetchCarDetails() async {
    if (currentUser == null) return; // Ensure we have a user ID

    getCarisLoading.value = true;
    try {
      // Get the user's document from Firestore
      DocumentSnapshot userDoc = await firestore.collection('MyCars').doc(currentUser).get();

      if (userDoc.exists) {
        // Extract carDetails array from the document
        var carDetails = userDoc.get('carDetails');
        if (carDetails != null) {
          // Convert each map in the list to a MyCarDetail object and add to carDetailsList
          carDetailsList.assignAll(
            (carDetails as List).map((carDetailMap) => MyCarDetail.fromMap(carDetailMap)).toList(),
          );
        }
      }
    } catch (e) {
      print("Error fetching car details: $e");
    } finally {
      getCarisLoading.value = false;
    }
  }


  // Future<PersonalInfo?> fetchPersonalInfo() async {
  //   isLoading.value = true;
  //   try {
  //     DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(currentUser)
  //         .get();
  //     if (docSnapshot.exists) {
  //       Map<String, dynamic>? data =
  //       docSnapshot.data() as Map<String, dynamic>?;
  //       if (data != null) {
  //         isLoading.value = false;
  //         return PersonalInfo.fromMap(data);
  //       }
  //     }
  //   } catch (e) {
  //     print("Error fetching user info: $e");
  //     isLoading.value = false;
  //   }
  //   isLoading.value = false;
  //   return null;
  // }
}


// class CarDetailsScreen extends StatelessWidget {
//   // Initialize the controller
//   final MyCarDetailController controller = Get.put(MyCarDetailController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("My Cars"),
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         } else if (controller.carDetailsList.isEmpty) {
//           return Center(child: Text("No cars added yet."));
//         } else {
//           return ListView.builder(
//             itemCount: controller.carDetailsList.length,
//             itemBuilder: (context, index) {
//               final carDetail = controller.carDetailsList[index];
//               return ListTile(
//                 leading: carDetail.carPic.isNotEmpty
//                     ? Image.network(carDetail.carPic, width: 50, height: 50)
//                     : Icon(Icons.directions_car),
//                 title: Text(carDetail.name),
//                 subtitle: Text("${carDetail.model}, ${carDetail.year}"),
//                 trailing: Text(carDetail.color),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }
