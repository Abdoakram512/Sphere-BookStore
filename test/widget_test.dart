import 'package:flutter_test/flutter_test.dart';

import 'package:sphere_book_app/main.dart';

void main() {
  testWidgets('App renders successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const SphereBookApp());

    expect(find.text('Sphere Book App'), findsOneWidget);
  });
}
