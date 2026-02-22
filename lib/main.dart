import 'package:delivery_project/delivery_app.dart';
import 'package:delivery_project/features/providers/auth_provider.dart';
import 'package:delivery_project/features/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'core/services/pref_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // setup providers before app starts
  final themeProvider = ThemeProvider();
  themeProvider.darkTheme = await ThemePreference().getTheme();

  final authProvider = AuthProvider();
  await authProvider.loadUserFromPrefs();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: themeProvider),
        ChangeNotifierProvider.value(value: authProvider),
      ],
      child: const DeliveryApp(),
    ),
  );
}
