// ignore_for_file: avoid_print

import 'package:delivery_project/features/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool switchValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ExpansionTile(
                  title: const Text("Appearance settings"),
                  children: [
                    SwitchListTile(
                      title: const Text('Dark Mode'),
                      value: themeProvider.darkTheme,
                      onChanged: (value) {
                        setState(() {});
                        themeProvider.darkTheme = value;
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text("Notification settings"),
                  children: [
                    SwitchListTile(
                      title: const Text('Order status updates'),
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {});
                        switchValue = value;
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Promotions & offers'),
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {});
                        switchValue = value;
                      },
                    ),
                    SwitchListTile(
                      title: const Text('Sound on new order updates'),
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {});
                        switchValue = value;
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text("Location Settings"),
                  children: [
                    InkWell(
                      onTap: () => print("mmmmm"),
                      child: const ListTile(
                        leading: Icon(Icons.location_city_rounded),
                        title: Text("Default delivery address"),
                      ),
                    ),
                    SwitchListTile(
                      title: const Text('Enable GPS auto-detect'),
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {});
                        switchValue = value;
                      },
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text("Payment Settings"),
                  children: [
                    InkWell(
                      onTap: () => print("mmmmm"),
                      child: const ListTile(
                        leading: Icon(Icons.credit_card_rounded),
                        title: Text("Saved Cards"),
                      ),
                    ),
                    InkWell(
                      onTap: () => print("mmmmm"),
                      child: const ListTile(
                        leading: Icon(Icons.check_circle_outline),
                        title: Text("Preferred payment method"),
                      ),
                    ),
                    SwitchListTile(
                      title: const Text('Enable cash on delivey option'),
                      value: switchValue,
                      onChanged: (value) {
                        setState(() {});
                        switchValue = value;
                      },
                    ),
                  ],
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
