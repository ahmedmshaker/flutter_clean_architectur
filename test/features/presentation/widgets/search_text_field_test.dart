import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/search_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rent_ready_task/l10n/l10n.dart';


class MockOnChanged extends Mock implements Function {
  void call(String query);
}

void main() {
  late MockOnChanged mockOnChanged;
  setUp(() {
    mockOnChanged = MockOnChanged();
  });

  testWidgets('SearchTextField', (WidgetTester tester) async {
    const key = Key("SearchTextField");
    await tester.pumpWidget(MaterialApp(
      key: key,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate
      ],
      home: Material(
        child: SearchTextField(
          onChanged: mockOnChanged,
        ),
      ),
    ));

    var txtForm = find.byType(TextField);
    //action
    await tester.enterText(txtForm, '123');


    //result
    verify(mockOnChanged.call("123"));
    expect(find.byKey(key), findsOneWidget);
    expect(find.text("123"), findsOneWidget);
  });
}
