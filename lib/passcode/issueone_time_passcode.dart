import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/widgets/auth.dart';
import 'package:smart_guard/widgets/reconize_screen.dart';

import 'addnew_person.dart';

class IssueOneTimePasscodeScreen extends StatelessWidget {
  const IssueOneTimePasscodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleAppBar(
        title: 'Issue one-time Passcode',
        subTitle:
            'You can add up to 3 people in list to whom you will\nallow to drive your car.',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.px),
        child: Column(children: [
          SizedBox(height: 3.7.h),
          CustomTextField(image: 'assets/auth/person.png', hinttext: 'Juan Matt'),
          SizedBox(height: 3.7.h),
          CustomTextField(image: 'assets/auth/person.png', hinttext: 'Lisa Can'),
          SizedBox(height: 3.7.h),
          AccessButton(text: 'Add New Person', ontap: (){
            Get.to(() => const AddNewPersonScreen());
          },image: 'assets/add person.png',),
        ],),
      ),
    );
  }
}
