import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../gen/assets.gen.dart';
import '../../../core/constants/app_colors.dart';
import '../../routers/route_name.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
  var a= await _determinePosition();
   if(a==true) {
     Navigator.of(context)
         .pushNamedAndRemoveUntil(RouteName.home, (route) => false);
   }else{
     Dialog(
       child: Text("that bai"),
     );
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue_weather,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              height: (1.sh) / 3,
            ),
            Assets.icons.cloudy.svg(
              width: 100.w,
              height: 100.h,
            ),
            SizedBox(
              height: 30.h,
            ),
            Text("Cloudy",
                style: TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 34.sp,
                  height: 51.h / 34.sp,
                  letterSpacing: 0.43.sp,
                )),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Dont worry about \n the weather we all here",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                height: 24.h / 16.sp,
                letterSpacing: 0.43.sp,
                color: AppColors.white,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}

Future<Object> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    Dialog(
      child: Container(
        child: Text("vui lòng bật định vị lên"),
      ),
    );
    return false;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      Dialog(
        child:Text("Ban da tu choi quyen dang nhap") ,
      );
      return false;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return false;
  }

  if(permission==LocationPermission.always ){
    return true;
  }
  if(permission==LocationPermission.whileInUse) return true;
  return true;
}
