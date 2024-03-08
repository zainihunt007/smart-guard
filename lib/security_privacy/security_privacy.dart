import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/widgets/reconize_screen.dart';

class SecurityPrivacyScreen extends StatelessWidget {
  const SecurityPrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleAppBar(title: 'Security & Privacy'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.px),
              Text(
                '1. Types data we collect',
                style: GoogleFonts.poppins(
                  fontSize: 12.px,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff383838),
                ),
              ),
              Text(
                "Our application collects two primary types of data to ensure the secure and seamless functioning of the vehicle access system. The first type of data includes biometric information, specifically facial and vocal data, which is used for owner identification through advanced recognition technologies. This data is processed locally on the user's device and is not stored on external servers to prioritize user privacy and security. The second type of data involves information related to access management, such as the creation of a list of authorized drivers and the generation of one-time passcodes for temporary access. This access control data is stored securely on the user's device, and no sensitive information is shared with external entities without explicit user consent. Our commitment to data protection extends to encryption measures and adherence to privacy regulations, ensuring the confidentiality and integrity of the collected data.",
                style: GoogleFonts.poppins(
                    color: Color(0xff717171),
                    fontWeight: FontWeight.w400,
                    fontSize: 10.px),
              ),
              SizedBox(height: 20.px),
              Text(
                '2. Use of your personal data',
                style: GoogleFonts.poppins(
                  fontSize: 12.px,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff383838),
                ),
              ),
              Text(
                "The use of personal data within our application is exclusively geared towards enhancing the security and functionality of the vehicle access system. The facial and vocal biometric information collected during the owner identification process is processed locally on the user's device, serving the sole purpose of enabling secure access to the car. This information is never transmitted or stored on external servers, safeguarding it from unauthorized access. Access control data, including the list of authorized drivers and one-time passcodes, is utilized solely for the purpose of managing and facilitating secure access to the vehicle as per the owner's preferences. We are committed to transparent and responsible data practices, ensuring that personal data is treated with the utmost confidentiality and used exclusively for the intended purposes outlined in our security and privacy policy. Users have the autonomy to customize their preferences and retain control over their personal data, fostering a secure and trusted user experience.",
                style: GoogleFonts.poppins(
                    color: Color(0xff717171),
                    fontWeight: FontWeight.w400,
                    fontSize: 10.px),
              ),
              SizedBox(height: 20.px),
              Text(
                '3. Disclosure of your personal data',
                style: GoogleFonts.poppins(
                  fontSize: 12.px,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff383838),
                ),
              ),
              Text(
                "We understand the importance of transparency regarding the disclosure of personal data within our application. It is crucial to clarify that the facial and vocal biometric information used for owner identification is processed locally on the user's device and is not shared with any external parties. No sensitive biometric data is transmitted or stored on external servers, ensuring that the owner's personal information remains confidential and secure. Access control data, such as the list of authorized drivers and generated one-time passcodes, is also kept strictly within the user's device, with no disclosure to third parties without explicit user consent. Our commitment to user privacy and data security extends to implementing robust encryption measures and compliance with relevant privacy regulations. We prioritize the protection of personal data and strive to maintain transparency in our data practices, providing users with the assurance that their information is handled responsibly and ethically.",
                style: GoogleFonts.poppins(
                    color: Color(0xff717171),
                    fontWeight: FontWeight.w400,
                    fontSize: 10.px),
              ),
              SizedBox(height: 30.px),
            ],
          ),
        ),
      ),
    );
  }
}
