import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_food/provider/food_provider.dart';
import 'package:random_food/screen/result_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FoodResult(),
        ),
        ChangeNotifierProvider(
          create: (_) => Category(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //앱 실행 시 처음 나오는 화면 설정
      home: ResultScreen(),
    );
  }
}
