import 'package:bemol_test/app/app.dart';
import 'package:bemol_test/src/presenter/view/pages/home/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders HomePage', (tester) async {
      await tester.pumpWidget(const BemolApp());

      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
