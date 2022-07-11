import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/presentation/home/home_view.dart';
import 'package:weather/presentation/splash/splash_view.dart';
import 'package:weather/utils/colors.dart';
import 'package:weather/utils/routes.dart';
import 'package:weather/utils/strings.dart';

void main() => runApp(const App());

class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: backgroundColor, statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
      title: app_name,
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: primaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: root,
      routes: {
        root: (context) => const Splash(),
        home: (context) => const Home(),
      },
    );
  }
}
