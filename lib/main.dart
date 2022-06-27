import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/home/view.dart';
import 'feature/on_boarding_intro/view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
        return Home.routName;
    } else {
      await prefs.setBool('seen', true);
      return OnBoardingScreen.routName;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkFirstSeen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              // navigatorKey: navigatorKey,
              // onGenerateRoute: onGenerateRoute,
              theme: ThemeData(
                // scrollbarTheme: const ScrollbarThemeData().copyWith(
                //   thumbColor: MaterialStateProperty.all(kPrimaryColor),
                // ),
                primarySwatch: Colors.blue,
              ),
              initialRoute: snapshot.data  as String,
              routes: {
                OnBoardingScreen.routName: (context) => OnBoardingScreen(),
                Home.routName: (context) => Home(),
              },
            );
          }
        });
  }}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}