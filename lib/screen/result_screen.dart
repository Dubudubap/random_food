import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_food/provider/food_provider.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key? key}) : super(key: key);
  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    final List category = context.watch<Category>().category;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'App Name',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
                imageSelector(context.watch<FoodResult>().foodResult)),
          ),
          Center(
            // 골라준 음식 이름 표시
            child: Text(
              '${context.watch<FoodResult>().foodResult}는(은) 어때요?',
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 버튼을 누르면 랜덤으로 음식을 골라주고 로딩 애니메이션 화면으로 이동
                  // 음식 골라주는 기능 구현했음
                  // 화면 이동은 구현 안함
                  OutlinedButton(
                      onPressed: () {
                        context.read<FoodResult>().selectFood(category);
                      },
                      child: const Text('다시 고르기')),
                  // 버튼을 누르면 네이버 지도 앱으로 이동 (앱 미설치 되어 있을 시 플레이 스토어로 이동)
                  OutlinedButton(
                      onPressed: () async {
                        await LaunchApp.openApp(
                          appStoreLink: null,
                          openStore: true,
                          androidPackageName: 'com.nhn.android.nmap',
                        );
                      },
                      child: const Text('네이버 지도에서 검색')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String imageSelector(String foodName) {
  String imageURL = 'assets/images/' + foodName + '.jpg';
  return imageURL;
}
