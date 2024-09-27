import 'package:flutter/material.dart';
import 'package:suzysoheee/components/custom_scaffold.dart';

class InquiryScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // 넓은 화면 (데스크톱)
              return Center( // 중앙 배치
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 800), // 고정된 너비 설정
                  child: _buildDesktopForm(),
                ),
              );
            } else {
              // 좁은 화면 (모바일)
              return _buildMobileForm();
            }
          },
        ),
      ),
    );
  }

  // 데스크톱 폼 레이아웃
  Widget _buildDesktopForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'DM: been_xae\nEmail: suzy@gmail.com\nPhone: 010-1234-5678',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: _buildTextField('성')),
            SizedBox(width: 20),
            Expanded(child: _buildTextField('이름')),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(child: _buildTextField('이메일 *')),
            SizedBox(width: 20),
            Expanded(child: _buildTextField('제목')),
          ],
        ),
        SizedBox(height: 20),
        _buildMessageField(),
        SizedBox(height: 20),
        _buildSubmitButton(),
      ],
    );
  }

  // 모바일 폼 레이아웃
  Widget _buildMobileForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'DM: been_xae\nEmail: suzy@gmail.com\nPhone: 010-1234-5678',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 16),
        ),
        SizedBox(height: 20),
        _buildTextField('성'),
        SizedBox(height: 20),
        _buildTextField('이름'),
        SizedBox(height: 20),
        _buildTextField('이메일 *'),
        SizedBox(height: 20),
        _buildTextField('제목'),
        SizedBox(height: 20),
        _buildMessageField(),
        SizedBox(height: 20),
        _buildSubmitButton(),
      ],
    );
  }

  // 텍스트 필드 생성
  Widget _buildTextField(String label) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: UnderlineInputBorder(),
      ),
      validator: (value) {
        if (label.contains('*') && (value == null || value.isEmpty)) {
          return '필수 입력 항목입니다.';
        }
        return null;
      },
    );
  }

  // 메시지 입력 필드
  Widget _buildMessageField() {
    return TextFormField(
      maxLines: 5,
      decoration: InputDecoration(
        labelText: '메시지를 남겨주세요.',
        border: OutlineInputBorder(),
      ),
    );
  }

  // 제출 버튼
  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('제출되었습니다.')));
        }
      },
      child: Text('제출'),
    );
  }
}