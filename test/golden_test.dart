import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:myexam/pages/Task2View.dart';

void main(){
  testWidgets("golden tests", (WidgetTester tester)async{
    await tester.pumpWidget( const MaterialApp(
      home: Task2view(),
    ),);
    await expectLater(find.byType(Task2view ),matchesGoldenFile("ui_sc.png"));

  });
}
// flutter test --update-goldens