import 'package:flutter_test/flutter_test.dart';
import 'package:flip/main.dart';
import 'package:flip/core/di/injection.dart';

void main() {
  testWidgets('App loads smoke test', (WidgetTester tester) async {
    // Initialize DI for testing
    DI().init();
    
    // Build our app and trigger a frame.
    await tester.pumpWidget(const FlipApp());

    // Verify that we are on the auth screen by looking for 'Login with VK'
    expect(find.text('Login with VK'), findsOneWidget);
  });
}
