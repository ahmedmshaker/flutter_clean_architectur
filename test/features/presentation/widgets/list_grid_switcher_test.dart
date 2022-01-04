import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/list_grid_switcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rent_ready_task/l10n/l10n.dart';

class MockListGridSwitcher extends Mock implements Function {
  void call(ListGridSwitcherType listGridSwitcherType);
}

void main() {
  late MockListGridSwitcher mockListGridSwitcher;
  setUp(() {
    mockListGridSwitcher = MockListGridSwitcher();
  });

  testWidgets('ListGridSwitcherWidget', (WidgetTester tester) async {
    const key = Key("ListGridSwitcherWidget");
    await tester.pumpWidget(MaterialApp(
      key: key,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate
      ],
      home: Material(
        child: ListGridSwitcherWidget(
          onWidgetSwitcherClick: mockListGridSwitcher,
        ),
      ),
    ));

    //action
    await tester.tap(find.byKey(Key(ListGridSwitcherType.listView.toString())));

    //result
    verify(mockListGridSwitcher.call(ListGridSwitcherType.listView));

    //action
    await tester.tap(find.byKey(Key(ListGridSwitcherType.gridView.toString())));
    //result
    verify(mockListGridSwitcher.call(ListGridSwitcherType.gridView));
    expect(find.byKey(key), findsOneWidget);
    expect(find.byType(InkWell), findsNWidgets(2));
  });
}
