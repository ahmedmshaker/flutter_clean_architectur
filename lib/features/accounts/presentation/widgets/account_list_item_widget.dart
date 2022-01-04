import 'package:flutter/material.dart';
import 'package:rent_ready_task/core/assets/app_assets.dart';
import 'package:rent_ready_task/features/accounts/data/models/account.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/account_info_widget.dart';

class AccountListItemWidget extends StatelessWidget {
  final Account account;

  const AccountListItemWidget({Key? key, required this.account})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            width: 16,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              placeHolder,
              width: 100,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 16,
              ),
              Text(
                account.name,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 16),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              AccountInfoWidget(account: account)
            ],
          )),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }
}
