import 'package:delivery_project/core/themes/prefs/prefernce.dart';
import 'package:delivery_project/core/themes/prefs/theme_provider.dart';
import 'package:delivery_project/core/themes/prefs/style.dart';
import 'package:delivery_project/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryApp extends StatefulWidget {
  const DeliveryApp({super.key});

  @override
  State<DeliveryApp> createState() => _DeliveryAppState();
}

class _DeliveryAppState extends State<DeliveryApp> {
  final ThemeProvider themeProvider = ThemeProvider(); // ✅ one instance

  void getCurrentTheme() async {
    themeProvider.darkTheme = await ThemePreference().getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: themeProvider, // ✅ reuse the same instance
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            theme: Style.themeData(themeProvider.darkTheme),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}


