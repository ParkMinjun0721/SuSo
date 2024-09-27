import 'package:flutter/material.dart';
import 'package:suzysoheee/components/custom_scaffold.dart';

class IntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // 넓은 화면 (데스크톱)
              return Row(
                children: [
                  Expanded(
                    child: _buildTextSection(),
                  ),
                  SizedBox(width: 20), // 이미지와 텍스트 사이 여백
                  Expanded(
                    child: _buildImageSection(),
                  ),
                ],
              );
            } else {
              // 좁은 화면 (모바일)
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildImageSection(),
                    SizedBox(height: 20), // 이미지와 텍스트 사이 여백
                    _buildTextSection(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // 텍스트 섹션 구성
  Widget _buildTextSection() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Color(0xFFEDF1F7), // 배경색 지정
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '대충 멋진 제목',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            '무언가 장황한 자기소개 말들. 나 김수지는 언제부터 작가 생활을 시작했으며, 어떤 작업물을 주력으로 하고있다. 나는 이러이러한 커리어를 가지고 있으며, 어떠어떠한 것들을 주로 하고자 한다.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            '대충 인스타, 트위터, 블로그 등등',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  // 이미지 섹션 구성
  Widget _buildImageSection() {
    return Container(
      child: Image.asset(
        'assets/images/suzy3.jpeg', // 제공된 이미지를 여기에 사용
        fit: BoxFit.cover,
      ),
    );
  }
}