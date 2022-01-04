import 'package:flutter/material.dart';
import 'package:rent_ready_task/core/assets/app_assets.dart';
import 'package:rent_ready_task/features/accounts/data/models/account.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/account_info_widget.dart';

class AccountGridItemWidget extends StatelessWidget {
  final Account account;

  const AccountGridItemWidget({Key? key, required this.account})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            placeHolder,
            height: 100,
            fit: BoxFit.cover,
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(start: 16, top: 16),
            child: Text(
              account.name,
              style:
                  Theme.of(context).textTheme.headline5!.copyWith(fontSize: 16),
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: AccountInfoWidget(account: account))
        ],
      ),
    );
  }
}
