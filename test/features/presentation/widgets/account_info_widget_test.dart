import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/account_info_widget.dart';
import 'package:rent_ready_task/l10n/l10n.dart';
import '../../mock_data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  testWidgets('AccountInfoWidget', (WidgetTester tester) async {
    const key = Key("AccountInfoWidget");
    await tester.pumpWidget(MaterialApp(
      key: key,
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate
      ],
      home: AccountInfoWidget(
        account: accountsResponse.accounts[0],
      ),
    ));

    //result
    expect(find.text("State Code : ${accountsResponse.accounts[0].statecode}"),
        findsOneWidget);
    expect(
        find.text(
            "state or province : ${accountsResponse.accounts[0].address1Stateorprovince}"),
        findsOneWidget);
    expect(
        find.text(
            "Account Number : ${accountsResponse.accounts[0].accountnumber}"),
        findsOneWidget);
    expect(find.byKey(key), findsOneWidget);
    expect(find.byType(AccountInfoWidget), findsOneWidget);
  });
}
