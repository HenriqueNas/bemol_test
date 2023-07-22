import 'package:bemol_test/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const BemolApp());
      // expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
