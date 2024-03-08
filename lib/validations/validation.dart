

import 'package:get/get.dart';

mixin Validations {
  String handleSingUpScreenError({
    nameTextController,
    emailTextController,
    passwordTextController,
    licenseNumberController,
  }) {
    if (nameTextController.text.isEmpty) {
      return "Name not be empty.";
    }  else if (emailTextController.text.isEmpty) {
      return "Email not be empty.";
    } else if (passwordTextController.text.isEmpty) {
      return "Password not be empty.";
    } else if (!isValidEmail.hasMatch(emailTextController.text)) {
      return "Please check your email.";
    } else if (passwordTextController.text.length < 8) {
      return "Password must be at least 8 characters in length.".tr;
    } else if(licenseNumberController.text.isEmpty){
      return "Please add a license no.".tr;
    }else if(!isValidPassword.hasMatch(passwordTextController.text)){
      return "Password should contain at least one upper case, lower case, one digit, Special character."
          .tr;
    } else {
      return '';
    }
  }

  handleLoginScreenError({
    emailTextController,
    passwordTextController,
  }) {
    if (emailTextController.text.isEmpty) {
      return "Email not be empty.".tr;
    } else if (passwordTextController.text.isEmpty) {
      return "Password not be empty.".tr;
    } else if (!isValidEmail.hasMatch(emailTextController.text)) {
      return "Please check your email.".tr;
    } else if (passwordTextController.text.length < 8) {
      return "Password must be at least 8 characters in length.".tr;
    } else if (!isValidPassword.hasMatch(passwordTextController.text)) {
      return "Password should contain at least one upper case, lower case, one digit, Special character."
          .tr;
    } else {
      return '';
    }
  }


  handleCarDetailScreenError({
    nameTextController,
    modelTextController,
    yearTextController,
    colorTextController,
    carNumberTextController,
}) {
    if(nameTextController.text.isEmpty){
      return "Please Enter name of Car".tr;
    }else if(modelTextController.text.isEmpty){
      return "Please Enter Model of Car".tr;
    } else if(yearTextController.text.isEmpty){
      return "Please Enter Year of Car".tr;
    } else if(colorTextController.text.isEmpty){
      return "Please Enter Color of Car".tr;
    } else if(carNumberTextController.text.isEmpty){
      return "Please Enter name of Car".tr;
    }else {
      return '';
    }

}

  // handleForgotPasswordEmailScreenError({
  //   emailTextController,
  // }) {
  //   if (emailTextController.text.isEmpty) {
  //     return "Email not be empty.".tr;
  //   } else if (!isValidEmail.hasMatch(emailTextController.text)) {
  //     return "Please check your email.".tr;
  //   } else {
  //     return '';
  //   }
  // }
  //
  // handleForgotPasswordOTPScreenError({
  //   otpTextController,
  // }) {
  //   if (otpTextController.text.isEmpty) {
  //     return "OTP not be empty.".tr;
  //   } else {
  //     return '';
  //   }
  // }
  //
  // handleForgotPasswordChangePasswordScreenError({
  //   passwordTextController,
  //   confirmPasswordTextController,
  // }) {
  //   if (passwordTextController.text.isEmpty) {
  //     return "Password not be empty.".tr;
  //   } else if (confirmPasswordTextController.text.isEmpty) {
  //     return "Confirm Password not be empty.".tr;
  //   } else if (passwordTextController.text.length < 8) {
  //     return "Password must be at least 8 characters in length.".tr;
  //   } else if (confirmPasswordTextController.text.length < 8) {
  //     return "Confirm password must be at least 8 characters in length.".tr;
  //   } else if (!isValidPassword.hasMatch(passwordTextController.text)) {
  //     return "Password should contain at least one upper case, lower case, one digit, Special character."
  //         .tr;
  //   } else if (!isValidPassword.hasMatch(confirmPasswordTextController.text)) {
  //     return "Confirm password should contain at least one upper case, lower case, one digit, Special character."
  //         .tr;
  //   } else if (confirmPasswordTextController.text !=
  //       passwordTextController.text ||
  //       passwordTextController.text != confirmPasswordTextController.text) {
  //     return "Passwords do not match.".tr;
  //   } else {
  //     return '';
  //   }
  // }
  //
  // handleEditProfileScreenError({
  //   fullNameTextController,
  //   initialsTextController,
  // }) {
  //   if (fullNameTextController.text.isEmpty) {
  //     return "Full name not be empty.".tr;
  //   } else if (initialsTextController.text.isEmpty) {
  //     return "Initials not be empty.".tr;
  //   } else {
  //     return '';
  //   }
  // }
  //
  // handleChangePasswordScreenError({
  //   currentPasswordTextController,
  //   newPasswordTextController,
  //   confirmPasswordTextController,
  // }) {
  //   if (currentPasswordTextController.text.isEmpty) {
  //     return "Current Password not be empty.".tr;
  //   } else if (newPasswordTextController.text.isEmpty) {
  //     return "New Password not be empty.".tr;
  //   } else if (confirmPasswordTextController.text.isEmpty) {
  //     return "Confirm Password not be empty.".tr;
  //   } else if (currentPasswordTextController.text.length < 8) {
  //     return "Current Password must be at least 8 characters in length.".tr;
  //   } else if (newPasswordTextController.text.length < 8) {
  //     return "New Password must be at least 8 characters in length.".tr;
  //   } else if (confirmPasswordTextController.text.length < 8) {
  //     return "Confirm password must be at least 8 characters in length.".tr;
  //   } else if (!isValidPassword.hasMatch(currentPasswordTextController.text)) {
  //     return "Current Password should contain at least one upper case, lower case, one digit, Special character."
  //         .tr;
  //   } else if (!isValidPassword.hasMatch(newPasswordTextController.text)) {
  //     return "New Password should contain at least one upper case, lower case, one digit, Special character."
  //         .tr;
  //   } else if (!isValidPassword.hasMatch(confirmPasswordTextController.text)) {
  //     return "Confirm password should contain at least one upper case, lower case, one digit, Special character."
  //         .tr;
  //   } else if (confirmPasswordTextController.text !=
  //       newPasswordTextController.text ||
  //       newPasswordTextController.text != confirmPasswordTextController.text) {
  //     return "Passwords do not match.".tr;
  //   } else {
  //     return '';
  //   }
  // }
  //
  //  handleAddMemberScreenError({
  //   firstNameTextController,
  //   lastNameTextController,
  //   initialsTextController,
  //   selectedColor,
  // }) {
  //   if (firstNameTextController.text.isEmpty) {
  //     return "First name not be empty.".tr;
  //   } else if (lastNameTextController.text.isEmpty) {
  //     return "Last name not be empty.".tr;
  //   } else if (initialsTextController.text.isEmpty) {
  //     return "Initials not be empty.".tr;
  //   }  else if (initialsTextController.text.length < 3) {
  //     return "Please enter 3 character initials.".tr;
  //   } else {
  //     return '';
  //   }
  // }
}

RegExp isValidEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

RegExp isValidPassword =
RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');