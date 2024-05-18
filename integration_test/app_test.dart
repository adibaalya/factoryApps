import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:factory_apps/main.dart' as app;

void main() {
  group("App Test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets('full app test', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      //login class

      final phoneFormField = find.byKey(const Key('phone'));
      final termsCheckbox = find.byType(Checkbox).first;
      final activationCodeButton =
          find.byKey(const Key('activationCodeButton'));

      await tester.enterText(phoneFormField, "0199121543");
      await tester.tap(termsCheckbox);
      await tester.tap(activationCodeButton);
      await tester.pumpAndSettle(Duration(seconds: 3));

      //authentication class
      final otpFormField = find.byKey(Key('otp'));
      final activateButton = find.byKey(Key('activateButton'));

      await tester.enterText(otpFormField, "123456");
      await tester.tap(activateButton);
      await tester.pumpAndSettle(Duration(seconds: 3));

      //homepage class
      await tester.tap(find.byKey(Key('profile')));
      await tester.pumpAndSettle(Duration(seconds: 3));

      //factory(1) profile
      await tester.tap(find.byKey(Key('factory1')));
      await tester.pumpAndSettle(Duration(seconds: 3));
      expect(find.byKey(Key('factory1')), findsOneWidget);
      await tester.tap(find.byKey(Key('addButton')));
      await tester.pumpAndSettle();

      final ownerFormField = find.byKey(Key('owner'));
      final ownerPhoneForm = find.byKey(Key('phone'));
      final submitButton = find.byKey(Key('submit'));

      await tester.enterText(ownerFormField, "adiba");
      await tester.enterText(ownerPhoneForm, "0199121543");
      await tester.tap(submitButton);

      await tester.pumpAndSettle();

      // Tap the widget with the key 'factory2'
      final factory2Button = find.byKey(Key('factory2'));
      expect(factory2Button, findsOneWidget);
      await tester.tap(factory2Button);
      await tester.pumpAndSettle(Duration(seconds: 3));

      expect(factory2Button, findsOneWidget);
      await tester.tap(find.byKey(Key('addButton')));
      await tester.pumpAndSettle();

      await tester.enterText(ownerFormField, "alya");
      await tester.enterText(ownerPhoneForm, "0199121543");
      await tester.tap(submitButton);
      await tester.pumpAndSettle(Duration(seconds: 3));

      //home
      await tester.tap(find.byKey(Key('home')));
      await tester.pump(Duration(seconds: 3));
      await tester.tap(find.byKey(Key('factory1')));
      await tester.pump(Duration(seconds: 3));
      await tester.tap(find.byKey(Key('factory2')));
      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.tap(find.byKey(Key('settings')));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('factory1')));
      await tester.pumpAndSettle();
      // Verify that the page is displayed correctly
      expect(find.text('Minimum Treshold'), findsOneWidget);

      // Test the Steam Pressure TextField
      final steamPressureTextField = find.byKey(Key('SteamPressure'));
      expect(steamPressureTextField, findsOneWidget);
      await tester.enterText(steamPressureTextField, '30 Bar');
      await tester.pump();
      expect(find.text('30 Bar'), findsOneWidget);

      // Test the Steam Flow TextField
      final steamFlowTextField = find.byKey(Key('SteamFlow'));
      expect(steamFlowTextField, findsOneWidget);
      await tester.enterText(steamFlowTextField, '23 T/H');
      await tester.pump();
      expect(find.text('23 T/H'), findsOneWidget);

      // Test the Water Level TextField
      final waterLevelTextField = find.byKey(Key('waterLevel'));
      expect(waterLevelTextField, findsOneWidget);
      await tester.enterText(waterLevelTextField, '54 %');
      await tester.pump();
      expect(find.text('54 %'), findsOneWidget);

      // Test the Power Frequency TextField
      final powerFrequencyTextField = find.byKey(Key('powerFrequency'));
      expect(powerFrequencyTextField, findsOneWidget);
      await tester.enterText(powerFrequencyTextField, '49 Hz');
      await tester.pump();
      expect(find.text('49 Hz'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: 3));

      // Simulate the tick button press
      await tester.testTextInput.receiveAction(TextInputAction.done);

// Wait for the widget to update
      await tester.pumpAndSettle(Duration(seconds: 2));



      await tester.tap(find.byKey(Key('factory2')));
      await tester.pumpAndSettle();
      // Verify that the page is displayed correctly
      expect(find.text('Minimum Treshold'), findsOneWidget);

      // Test the Steam Pressure TextField
      expect(steamPressureTextField, findsOneWidget);
      await tester.enterText(steamPressureTextField, '30 Bar');
      await tester.pump();
      expect(find.text('30 Bar'), findsOneWidget);

      // Test the Steam Flow TextField

      expect(steamFlowTextField, findsOneWidget);
      await tester.enterText(steamFlowTextField, '23 T/H');
      await tester.pump();
      expect(find.text('23 T/H'), findsOneWidget);

      // Test the Water Level TextField
      expect(waterLevelTextField, findsOneWidget);
      await tester.enterText(waterLevelTextField, '54 %');
      await tester.pump();
      expect(find.text('54 %'), findsOneWidget);

      // Test the Power Frequency TextField
      expect(powerFrequencyTextField, findsOneWidget);
      await tester.enterText(powerFrequencyTextField, '49 Hz');
      await tester.pump();
      expect(find.text('49 Hz'), findsOneWidget);
      await tester.pumpAndSettle(Duration(seconds: 2));


    });
  });
}
