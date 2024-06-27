import 'package:bmi/bindings/bmi_bindings.dart';
import 'package:bmi/view/bmi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPrefrences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPrefrences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialBinding: BmiBindings(),
      locale:Locale(sharedPrefrences?.getString('lang') ?? 'en'),
      supportedLocales:const  [
        Locale('en'),
        Locale('ar'),
      ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const BmiView(),
    );
  }
}
