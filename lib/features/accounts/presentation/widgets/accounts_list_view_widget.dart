import 'package:flutter/material.dart';
import 'package:rent_ready_task/features/accounts/data/models/account.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/account_list_item_widget.dart';

class AccountsListViewWidget extends StatelessWidget {
  final List<Account> accounts;

  const AccountsListViewWidget({Key? key, required this.accounts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // the number of items in the list
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return AccountListItemWidget(
            account: accounts[index],
          );
        });
  }
}
