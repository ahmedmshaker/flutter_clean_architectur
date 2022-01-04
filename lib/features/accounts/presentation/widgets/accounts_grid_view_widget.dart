import 'package:flutter/material.dart';
import 'package:rent_ready_task/features/accounts/data/models/account.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/account_grid_item_widget.dart';

class AccountsGridViewWidget extends StatelessWidget {
  final List<Account> accounts;

  const AccountsGridViewWidget({Key? key, required this.accounts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var gridView = GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 265,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16),
        padding: const EdgeInsets.all(16),
        itemCount: accounts.length,
        itemBuilder: (BuildContext ctx, index) {
          return AccountGridItemWidget(
            account: accounts[index],
          );
        });
    return gridView;
  }
}
