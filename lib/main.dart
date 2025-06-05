import 'package:device_frame_plus/device_frame_plus.dart';
import 'package:flashcards/data/database.dart';
import 'package:flashcards/global.dart';
import 'package:flashcards/screens/collections_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  appDatabase = AppDatabase();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          body: Center(
            child: DeviceFrame(
              device: Devices.android.samsungGalaxyNote20,
              screen: const MaterialApp(
                home: CollectionsScreen(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
