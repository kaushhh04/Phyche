import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class Mood extends StatefulWidget {
  const Mood({Key? key}) : super(key: key);

  @override
  _MoodState createState() => _MoodState();
}

class _MoodState extends State<Mood> {
  String pathOfImage = "ahsdg";
  String moodImagePath = "";
  String moodDetail = "";
  bool isVisible = false;

  FaceDetector detector = GoogleMlKit.vision.faceDetector(
    FaceDetectorOptions(
      enableClassification: true,
      enableLandmarks: true,
      enableContours: true,
      enableTracking: true,
    ),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    detector.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: isVisible,
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  moodImagePath,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Text(
                "Your Mood is $moodDetail",
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 30,
                ),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  pickImage();
                  Future.delayed(Duration(seconds: 7), () {
                    extractData(pathOfImage);
                  });
                },
                child: const Text(
                  "Pick Image",
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 30,
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void pickImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      pathOfImage = image!.path;
    });
  }

  void extractData(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    List<Face> faces = await detector.processImage(inputImage);

    if (faces.length > 0 && faces[0].smilingProbability != null) {
      double? prob = faces[0].smilingProbability;

      if (prob! > 0.8) {
        setState(() {
          moodDetail = "Happy";
          moodImagePath = "asset/image/happy.png";
        });
      } else if (prob > 0.3 && prob < 0.8) {
        setState(() {
          moodDetail = "Normal";
          moodImagePath = "asset/image/meh.png";
        });
      } else if (prob > 0.06152385 && prob < 0.3) {
        setState(() {
          moodDetail = "Sad";
          moodImagePath = "asset/image/sad.png";
        });
      } else {
        setState(() {
          moodDetail = "Angry";
          moodImagePath = "asset/image/angry.png";
        });
      }
      setState(() {
        isVisible = true;
      });
    }
  }
}