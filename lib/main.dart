import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sample_latest/latest_3.0.dart';
import 'package:sample_latest/routing.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  Dart3Features('krishna', 'yedlapalli');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: Locale('en'),
      // onGenerateTitle: (context) => DemoLocalizations.of(context).title,
      // backButtonDispatcher: () => ,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es')
      ],
      /// text scale factor
      builder: (BuildContext context, Widget? child){
        var data = MediaQuery.of(context);
        return MediaQuery(data:data.copyWith(
            textScaleFactor : data.textScaleFactor,
        ),
            child: child ?? Container());
      },
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        appBarTheme: const AppBarTheme(color: Colors.green, shadowColor: Colors.red, elevation: 5, foregroundColor: Colors.white),
        hoverColor: Colors.orangeAccent,

        /// Icon theme
        iconTheme: const IconThemeData(
            color: Colors.orange,
            fill: 0.0,

            /// fills the space
            opacity: 1.0,
            size: 40,
            weight: 100,

            /// varies from 100 to 700
            opticalSize: 20,

            /// Optical sizes range from 20dp to 48dp. we can maintain
            /// the stroke width common while resizing or on increase of the icon size
            grade: 0 // (For light and dart themes) To make strokes heavier and more emphasized, use positive value grade, such as when representing an active icon state.
            ),

        /// Card Theme
        cardTheme: const CardTheme(color: Colors.lightBlueAccent, margin: EdgeInsets.all(16), shadowColor: Colors.green, elevation: 5, surfaceTintColor: Colors.red),

        /// Text Theme data
        textTheme: TextTheme(

        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0X5E1BC2),
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.light,
      routerConfig: buildRoute(context),
    );
  }
}


@pragma(
    'vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case 'be.tramckrijte.workmanagerExample.simpleTask':
        WidgetsFlutterBinding.ensureInitialized();
        DartPluginRegistrant.ensureInitialized();
        int i = 0;
        // while (i < 120) {
        //   await Future.delayed(Duration(seconds: 2));
        //   AudioCache audioPlayer = AudioCache(fixedPlayer: AudioPlayer(mode: PlayerMode.MEDIA_PLAYER));
        //   audioPlayer.play('announcement.mp3');
        //   i ++;
        // }
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // await prefs.setInt('getTimeBackground', i+200);
        // var a = prefs.getInt('getTimeBackground');
        // print(a);
        break;
      case Workmanager.iOSBackgroundTask:
        print("The iOS background fetch was triggered");
        // Directory tempDir = await getTemporaryDirectory();
        // String tempPath = tempDir.path;
        print(
            "You can access other plugins in the background, for example Directory.getTemporaryDirectory(): ");
        break;
    }

    return Future.value(true);
  });
}