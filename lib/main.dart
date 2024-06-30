import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_app/models/authentication/user_model.dart';
import 'package:payment_app/screens/splash/splash_screen.dart';
import 'package:payment_app/services/secure_storage.dart';
import 'package:payment_app/services/user_manager/auth_manager.dart';
import 'package:payment_app/theme/theme.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive..registerAdapter(UserModelAdapter());
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (_, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        theme: lightMode,
        darkTheme: darkMode,
      );
    });
  }
}
