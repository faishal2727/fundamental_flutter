import 'package:flutter/material.dart';


import 'package:fundamental_submission/app/theme/color.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme:
            GoogleFonts.poppinsTextTheme().apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
    ),
  );
}
