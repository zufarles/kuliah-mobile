import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/login.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await Supabase.initialize(
      url: 'https://twqqqxdpjoyzxkmxbcud.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InR3cXFxeGRwam95enhrbXhiY3VkIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcwMTE2NjAzMywiZXhwIjoyMDE2NzQyMDMzfQ.zfi8oxQAySt6vh5WvJz7idivjLYfye5kubAitROHmYI');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: LoginPage(),
      ),
    );
  }
}
