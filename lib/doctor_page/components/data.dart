import 'package:flutter/cupertino.dart';
import '../models/doctor.dart';

List<SpecialityModel> getSpeciality(){

  List<SpecialityModel> specialities = <SpecialityModel>[];
  var specialityModel = new SpecialityModel(imgAssetPath: '', speciality: '', noOfDoctors: 1, backgroundColor: CupertinoColors.activeBlue);

  //1
  specialityModel.noOfDoctors = 10;
  specialityModel.speciality = "Cough & Cold";
  specialityModel.imgAssetPath = "asset/image/img1.png";
  specialityModel.backgroundColor = Color(0xffFBB97C);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel(imgAssetPath: '', speciality: '', noOfDoctors: 1, backgroundColor: CupertinoColors.activeBlue);

  //2
  specialityModel.noOfDoctors = 17;
  specialityModel.speciality = "Heart Specialist";
  specialityModel.imgAssetPath = "asset/image/img2.png";
  specialityModel.backgroundColor = Color(0xffF69383);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel(imgAssetPath: '', speciality: '', noOfDoctors: 1, backgroundColor: CupertinoColors.activeBlue);

  //3
  specialityModel.noOfDoctors = 27;
  specialityModel.speciality = "Diabetes Care";
  specialityModel.imgAssetPath = "asset/image/img3.png";
  specialityModel.backgroundColor = Color(0xffEACBCB);
  specialities.add(specialityModel);

  specialityModel = new SpecialityModel(imgAssetPath: '', speciality: '', noOfDoctors: 1, backgroundColor: CupertinoColors.activeBlue);

  return specialities;
}