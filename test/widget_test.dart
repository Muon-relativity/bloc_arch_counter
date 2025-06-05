// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bloc_arch_counter/main.dart';

import 'package:bloc_arch_counter/injection_container.dart' as di;

void main() {
  // Initialize the dependency injection container
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await di.init();
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // MyApp 위젯을 테스트 환경에 빌드합니다.
    await tester.pumpWidget(MyApp());

    // 초기값 0이 화면에 있는지 확인합니다.
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Text && widget.data != null && widget.data!.contains('0'),
      ),
      findsOneWidget,
    );

    // + 아이콘을 찾아 탭합니다.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // 값이 1로 증가했는지 확인합니다.
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Text && widget.data != null && widget.data!.contains('1'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('Counter decrements smoke test', (WidgetTester tester) async {
    // MyApp 위젯을 테스트 환경에 빌드합니다.
    await tester.pumpWidget(MyApp());

    // + 아이콘을 찾아 탭하여 값을 1로 증가시킵니다.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // - 아이콘을 찾아 탭합니다.
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // 값이 0으로 감소했는지 확인합니다.
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Text && widget.data != null && widget.data!.contains('0'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('Counter resets smoke test', (WidgetTester tester) async {
    // MyApp 위젯을 테스트 환경에 빌드합니다.
    await tester.pumpWidget(MyApp());

    // + 아이콘을 찾아 탭하여 값을 1로 증가시킵니다.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Reset 아이콘을 찾아 탭합니다.
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pump();

    // 값이 0으로 리셋되었는지 확인합니다.
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Text && widget.data != null && widget.data!.contains('0'),
      ),
      findsOneWidget,
    );
  });
}
