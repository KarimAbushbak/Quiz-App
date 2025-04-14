import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/constants.dart';
import 'core/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: KeyConstants.projectURL,
    anonKey: KeyConstants.annonKey,
  ).timeout(const Duration(seconds: 5), onTimeout: () {
    throw Exception("Supabase initialization timed out");
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: true,
      designSize: Size(
        Constants.designDeviceWidth,
        Constants.designDeviceHeight,
      ),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(useMaterial3: true),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splashScreen,
          onGenerateRoute: RouteGenerator.getRoute,
        );
      },
    );
  }
}
