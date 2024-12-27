import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myexam/auth/loginpage.dart';

void main(){
  testWidgets("golden tests", (WidgetTester tester)async{
    await tester.pumpWidget( const MaterialApp(
      home: LoginScreen(),
    ),);
    await expectLater(find.byType(LoginScreen ),matchesGoldenFile("ui_sc.png"));

  });
}
// flutter test --update-goldens