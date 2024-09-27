import 'package:flutter/material.dart';
import 'package:suzysoheee/components/custom_scaffold.dart';
import 'image_detail_screen.dart';
import 'image_data.dart'; // 이미지 데이터 파일을 임포트

class CommissionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            // 화면 크기에 따라 그리드 열의 개수를 조정
            int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
            return GridView.builder(
              padding: EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount, // 웹: 3개, 모바일: 2개
                childAspectRatio: 1, // 이미지가 정사각형이 되도록 설정
                crossAxisSpacing: 20, // 이미지 간의 수평 간격
                mainAxisSpacing: 20, // 이미지 간의 수직 간격
              ),
              itemCount: imageList.length, // image_data.dart에서 불러온 리스트 사용
              itemBuilder: (context, index) {
                final imageInfo = imageList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(_createRoute(
                      ImageDetailScreen(
                        imagePath: imageInfo['imagePath']!,
                        title: imageInfo['title']!,
                        description: imageInfo['description']!,
                        heroTag: 'imageHero$index', // Hero 태그 전달
                      ),
                    ));
                  },
                  child: Hero(
                    tag: 'imageHero$index', // 고유한 Hero 태그
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(imageInfo['imagePath']!),
                          fit: BoxFit.cover, // 이미지를 카드 전체에 채움
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  // FadeTransition을 적용한 페이지 이동
  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}