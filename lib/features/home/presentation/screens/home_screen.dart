// ignore_for_file: avoid_print

import 'package:delivery_project/features/settings/presentation/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.person), text: "Profile"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Home(),
            Scaffold(body: Center(child: Text("Profile"))),
            SettingsScreen(),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                print("mena");
              },
              child: Row(
                children: [
                  // البداية
                  const Icon(Icons.abc_outlined),
                  const SizedBox(width: 10),
                  const Column(
                    children: [
                      Text('Hellvvcxvxcvxcvxvxcvxvco'),
                      Text('Hellvvcxvxcvxcvxvxcvxvco'),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.access_alarms),
                  ),
                  // الحيطة
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     print("segda");
            //   },
            //   child: Row(
            //     children: [
            //       // البداية
            //       const Icon(Icons.abc_outlined),
            //       const SizedBox(width: 10),
            //       const Column(
            //         children: [
            //           Text('Hellvvcxvxcvxcvxvxcvxvco'),
            //           Text('Hellvvcxvxcvxcvxvxcvxvco'),
            //         ],
            //       ),
            //       const Spacer(),
            //       IconButton(
            //         onPressed: () {},
            //         icon: const Icon(Icons.access_alarms),
            //       ),
            //       // الحيطة
            //     ],
            //   ),
            // ),
            ListTile(
              onTap: () {
                print("sagda ----- mena");
              },
              leading: const Icon(Icons.abc_outlined),
              title: const Text('Hellvvcxvxcvxcvxvxcvxvco'),
              subtitle: const Text('Hellvvcxvxcvxcvxvxcvxvco'),
              trailing: IconButton(
                onPressed: () {
                  print("mohamed");
                },
                icon: const Icon(Icons.settings),
              ),
            ),

            const ExpansionTile(
              title: Text('Hellvvcxvxcvxcvxvxcvxvco'),
              children: [
                Text('Hellvvcxvxcvxcvxvxcvxvco'),
                Text('Hellvvcxvxcvxcvxvxcvxvco'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
