import 'package:flutter_test/flutter_test.dart';
import 'package:shanti_sthapna_mission/main.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ShantiSthapnaApp());

    // Verify that the title is present.
    expect(find.text('SHANTI STHAPNA'), findsOneWidget);
  });
}
