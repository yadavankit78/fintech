import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:neu_byte_digital/route/router.dart';
import 'package:neu_byte_digital/screens/dashboard/screens/views/dashboard_screen.dart';
import 'package:neu_byte_digital/screens/outboard/intro_screen.dart';
import 'package:neu_byte_digital/theme/theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2) ,() {
       FlutterNativeSplash.remove();
    },);
    super.initState();
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme().lightTheme ,
      onGenerateRoute: (settings) => generateRoute(settings),
     // initialRoute:  ,
      home: const DashboardScreen() ,
    );
  }
}

