import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/core/app_color.dart';
import 'package:hotel_app/feature/hotel/presentation/manager/hotel_cubit.dart';
import 'package:hotel_app/feature/hotel/presentation/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

