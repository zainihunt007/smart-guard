import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_guard/recognize_section/voice_recognization_screen.dart';
import 'package:smart_guard/widgets/auth.dart';

import '../widgets/reconize_screen.dart';

class FaceRecognizationScreen extends StatefulWidget {
  const FaceRecognizationScreen({super.key});

  @override
  State<FaceRecognizationScreen> createState() =>
      _FaceRecognizationScreenState();
}

class _FaceRecognizationScreenState extends State<FaceRecognizationScreen> {
  // List<CameraDescription>? cameras;
  // CameraController? cameraController;
  //
  // int direction = 0;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   startCamera(direction);
  // }
  //
  // void startCamera(int direction) async {
  //   cameras = await availableCameras();
  //
  //   cameraController = CameraController(
  //     cameras![direction],
  //     ResolutionPreset.high,
  //     enableAudio: false,
  //   );
  //
  //   await cameraController!.initialize().then((_) {
  //     if (!mounted) {
  //       return;
  //     }
  //     setState(() {}); // To refresh widget
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

  List<CameraDescription>? cameras;
  CameraController? cameraController;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  // This method initializes the camera with the front camera by default
  void initCamera() async {
    // Get the list of available cameras.
    cameras = await availableCameras();

    // Find the front camera in the list of available cameras.
    final CameraDescription frontCamera = cameras!.firstWhere(
          (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras![0], // Fallback to the first camera if no front camera is found.
    );

    // Initialize the camera controller with the front camera.
    cameraController = CameraController(
      frontCamera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    // Initialize the camera and refresh the widget if mounted.
    await cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {}); // To refresh widget
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TitleAppBar(
        title: 'Face Recognition',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.px),
        child: Column(
          children: [
            SizedBox(height: 6.8.h),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: 'Time left ',
                  style: GoogleFonts.poppins(
                    fontSize: 14.px,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff59636B),
                  ),
                  children: [
                    TextSpan(
                      text: '02:10',
                      style: GoogleFonts.poppins(
                        fontSize: 14.px,
                        // fontWeight: FontWeight.w400,
                        color: const Color(0xff1E1E1E),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.px),
            cameraController != null && cameraController!.value.isInitialized
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(33.px),
                    child: SizedBox(
                      height: 334.px,
                      // width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(33.px),
                      // ),
                      child: CameraPreview(cameraController!),
                    ),
                  )
                : const SizedBox.shrink(),
            // Image.asset('assets/recognize/face_two 1.png'),
            SizedBox(height: 5.h),
            Text(
              textAlign: TextAlign.center,
              'Face Recognition is Successful. You can drive the car.',
              style: GoogleFonts.poppins(
                fontSize: 13.px,
                fontWeight: FontWeight.w500,
                color: const Color(0xff4CAF50),
              ),
            ),
            SizedBox(height: 8.h),
            AccessButton(
                text: 'Ok',
                ontap: () {
                  // openFaceRecognizeDialog();
                  Get.back();
                }),
          ],
        ),
      ),
    );
  }
}

void openFaceRecognizeDialog() {
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
              padding: const EdgeInsets.all(40.0),
              child: Material(
                child: Column(
                  children: [
                    // SizedBox(height: 32.h),
                    Text(
                      "Face Recognition is Failed.",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 13.px,
                        color: const Color(0xffFF2121),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 5.px),
                    Image.asset(
                      'assets/recognize/image 1.png',
                      width: 200,
                      height: 156,
                    ),
                    Text(
                      'Face Recognition has been failed, you can try another option',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 13.px,
                        color: const Color(0xffA6A6A6),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 22.px),
                    AccessButton(
                        text: 'Back to homepage',
                        ontap: () {
                          Get.to(() => const VoiceRecognizationScreen());
                        }),
                    //Buttons
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
