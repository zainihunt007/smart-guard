import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/colors/const_colors.dart';
import 'package:smart_guard/recognize_section/profile_faceRecognization.dart';
import 'package:smart_guard/recognize_section/profile_voic_reg_screen.dart';
import 'package:smart_guard/recognize_section/reconize_screen.dart';
import 'package:smart_guard/widgets/auth.dart';
import 'package:smart_guard/widgets/utils.dart';
import '../auth/signup_screen.dart';
import '../widgets/reconize_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // String? _selectedValue;
  final PersonalInfoController personalInfoController =
      Get.put(PersonalInfoController());

  bool imageSelected = false;
  File? image; // Make image nullable
  final picker = ImagePicker();

// Image Picker function to get image from gallery
  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        imageSelected = true;
      } else {
        imageSelected = false; // Reset imageSelected
      }
    });
  }

  final List<String> dropdownValues = [
    "Male",
    "Female",
    "Other",
  ];

  // TitleAppBar(
  // title: 'Complete Your Profile',
  // subTitle:
  // 'Only you can see your personal data. No one else will\nbe able to see it',
  // ),

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   personalInfoController.fetchPersonalInfo();
  // }
// RxString gender='Male'.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(() => RecognizeScreen());
          },
          icon: Icon(Icons.arrow_back_ios_rounded,
              color: Colors.black, size: 15.px),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              textAlign: TextAlign.start,
              'Complete Your Profile',
              style: GoogleFonts.poppins(
                  fontSize: 13.px,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff222222)),
            ),
            Text(
              'Only you can see your personal data. No one else will\nbe able to see it'!,
              style: GoogleFonts.poppins(
                fontSize: 10.px,
                fontWeight: FontWeight.w400,
                color: const Color(0xff494949),
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.px),
            child: Column(
              children: [
                SizedBox(height: 4.h),
                Center(
                  child: SizedBox(
                    height: 111.px,
                    width: 111.px,
                    child: Stack(
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.white,
                            backgroundImage: imageSelected
                                ? FileImage(image!)
                                : personalInfoController.personalInfo != null &&
                                        personalInfoController
                                                .personalInfo!.profilePic != null &&
                                        personalInfoController
                                            .personalInfo!.profilePic.isNotEmpty
                                    ? NetworkImage(personalInfoController
                                        .personalInfo!.profilePic)
                                    : const AssetImage('assets/Ellipse 227.png')
                                        as ImageProvider,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 2,
                          child: GestureDetector(
                            onTap: () {
                              getImageFromGallery();
                            },
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Color(0xffF5F5F5),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: AppColors.appColorBlue,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 4.h),
                CustomTextField(
                  image: 'assets/drawer/Vector.png',
                  hinttext: personalInfoController.personalInfo?.name ?? 'name',
                  controller: personalInfoController.nameController,
                ),
                SizedBox(height: 5.h),
                SizedBox(
                  height: 44.px,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: TextFormField(
                      controller: personalInfoController.phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: personalInfoController.personalInfo?.phone ??
                            'phone',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 12.px,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffA6A6A6),
                        ),
                        contentPadding: const EdgeInsets.only(top: 5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(22),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: CountryCodePicker(
                          onChanged: (countryCode) {
                            personalInfoController.countryCode =
                                countryCode.dialCode!;
                          },
                          hideMainText: true,
                          initialSelection: 'United Kingdom',
                          favorite: ['+44', 'UK'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          flagWidth: 20,
                          padding: EdgeInsets.all(0),
                          showFlagMain: true,
                        ),
                      ),
                    ),
                  ),
                ), // country picker
                SizedBox(height: 5.h),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 44.px,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // Shadow color
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: DropdownButtonFormField<String>(
                        hint: Text(
                          personalInfoController.personalInfo?.gender ??
                              'gender',
                          style: GoogleFonts.poppins(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffA6A6A6),
                          ),
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: '',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 12.px,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffA6A6A6),
                          ),
                          contentPadding: const EdgeInsets.only(top: 5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            width: 8,
                            height: 8,
                            child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/input-onlinepngtools.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        value: personalInfoController.selectedGender,
                        onChanged: (newValue) {
                          personalInfoController.selectedGender = newValue;
                        },
                        items: dropdownValues.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: GoogleFonts.poppins(
                                fontSize: 12.px,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xffA6A6A6),
                              ),
                            ),
                          );
                        }).toList(),
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Image.asset(
                            'assets/dropdown.png',
                            width: 10,
                            height: 10,
                          ),
                        ),
                        validator: (value) =>
                            value == null ? 'Field required' : null,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                CustomTextField(
                    image: 'assets/person scanner.png',
                    hinttext: 'Face Recognition',
                    sfxImage: 'assets/evaArrowIosBackOutline2.png',
                    readOnly: true,
                    ontap: () {
                      Get.to(() => const ProfileFaceRecognization());
                    }),
                SizedBox(height: 5.h),
                CustomTextField(
                  image: 'assets/voice.png',
                  hinttext: 'Voice Recognition',
                  sfxImage: 'assets/evaArrowIosBackOutline2.png',
                  readOnly: true,
                  ontap: () {
                    Get.to(() => const ProfileVoiceRecognizationScreen());
                  },
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 27.px),
                  child: personalInfoController.updateIsLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                              color: AppColors.appColorBlue),
                        )
                      : AccessButton(
                          text: 'Done',
                          ontap: () {
                            personalInfoController.updateUserPersonalInfo(
                                context, image);
                          }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class PersonalInfo {
//   final String name;
//   final String phone;
//   final String gender;
//   final String picUrl; // Add this line
//
//   PersonalInfo({
//     required this.name,
//     required this.phone,
//     required this.gender,
//     this.picUrl = '', // Initialize with an empty string or a default image URL
//   });
//
//   Map<String, dynamic> toMap() {
//     return {
//       'name': name,
//       'phone': phone,
//       'gender': gender,
//       'picUrl': picUrl, // Add this line
//     };
//   }
//
//   factory PersonalInfo.fromMap(Map<String, dynamic> map) {
//     return PersonalInfo(
//       name: map['name'],
//       phone: map['phone'],
//       gender: map['gender'],
//       picUrl: map['picUrl'] ??
//           '', // Add this line, with a fallback to an empty string
//     );
//   }
// }

class PersonalInfoController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String countryCode = '+44';
  String? selectedGender;
  RxBool isLoading = false.obs;
  RxBool updateIsLoading = false.obs;
  UserModel? personalInfo;
  StreamSubscription<DocumentSnapshot>? subscription;

  // RxBool imageSelected = false.obs;
  // File? image; // Make image nullable
  // final picker = ImagePicker();
  //
  // //Image Picker function to get image from gallery
  // Future getImageFromGallery() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     image = File(pickedFile.path);
  //     imageSelected.value = true;
  //   } else {
  //     imageSelected.value = false; // Add this line to handle deselection
  //   }
  // }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final currentUser = FirebaseAuth.instance.currentUser?.uid;

  Future<void> updateUserPersonalInfo(
      BuildContext context, File? imageFile) async {
    // Create a map to hold updated fields
    Map<String, dynamic> updatedFields = {};

    // Check each field for changes and add them to the map
    if (nameController.text.isNotEmpty) {
      updateIsLoading.value = true;
      updatedFields['name'] = nameController.text;
      updateIsLoading.value = false;
    }
    if (phoneController.text.isNotEmpty) {
      updateIsLoading.value = true;
      updatedFields['phone'] = phoneController.text;
      updateIsLoading.value = false;
    }
    if (phoneController.text.isNotEmpty) {
      // Combine the country code with the phone number
      updateIsLoading.value = true;
      updatedFields['phone'] = "$countryCode${phoneController.text}";
      updateIsLoading.value = false;
    }
    if (selectedGender != null) {
      updateIsLoading.value = true;
      updatedFields['gender'] = selectedGender;
      updateIsLoading.value = false;
    }

    try {
      // Handle image update separately because it requires async operation

      if (imageFile != null) {
        updateIsLoading.value = true;
        // Upload image to Firebase Storage and get URL
        String fileName = 'profile_pics/$currentUser.jpg';
        Reference firebaseStorageRef =
            FirebaseStorage.instance.ref().child(fileName);
        UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
        TaskSnapshot taskSnapshot = await uploadTask;
        String picUrl = await taskSnapshot.ref.getDownloadURL();

        // Add picUrl to the update fields
        updatedFields['profilePic'] = picUrl;
      }

      // Update the user info in Firestore only if there are fields to update
      if (updatedFields.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .update(updatedFields)
            .then((value) {
          log('update Successfully ');
          customScaffoldMessenger(context, 'Update Successfully');
        });
      } else {
        // Optionally, handle the case where no fields have been updated
        customScaffoldMessenger(context, 'No changes to update');
        print("No changes to update");
      }
    } catch (e) {
      print(e.toString());
      // Optionally, show the error to the user
      customScaffoldMessenger(context, 'Update Failed: ${e.toString()}');
    } finally {
      updateIsLoading.value = false;
    }
  }

  Future<void> fetchPersonalInfo() async {
    isLoading.value = true;
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      isLoading.value = false;
      return;
    }

    final docReference =
        FirebaseFirestore.instance.collection('users').doc(currentUser.uid);

    subscription = docReference.snapshots().listen((docSnapshot) {
      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        if (data != null) {
          isLoading.value = false;
          personalInfo = UserModel.fromMap(data);
        }
      }
    }, onError: (error) {
      print('Error fetching user info: $error');
      isLoading.value = false;
    });
  }

  // Rx<UserModel> _user = UserModel(
  //   name: '',
  //   licenseNumber: '',
  //   gender: '',
  //   phone: '',
  //   profilePic: '',
  // ).obs;
  //
  // UserModel get user => _user.value;
  //
  // setUser(UserModel user) {
  //   _user.value = user;
  // }
  //
  // @override
  // void onClose() {
  //   // Close subscriptions or perform cleanup if necessary
  //   super.onClose();
  // }
}
