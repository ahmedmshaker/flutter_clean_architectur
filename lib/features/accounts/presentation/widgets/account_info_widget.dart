import 'package:flutter/material.dart';
import 'package:rent_ready_task/features/accounts/data/models/account.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountInfoWidget extends StatelessWidget {
  const AccountInfoWidget({
    Key? key,
    required this.account,
  }) : super(key: key);

  final Account account;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsetsDirectional.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[300],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText(context,
              AppLocalizations.of(context)!.stateCode(account.statecode)),
          const SizedBox(
            height: 8,
          ),
          _buildText(
              context,
              AppLocalizations.of(context)!
                  .stateOrProvince(account.address1Stateorprovince)),
          const SizedBox(
            height: 8,
          ),
          _buildText(
              context,
              AppLocalizations.of(context)!
                  .accountNumber(account.accountnumber))
        ],
      ),
    );
  }

  Text _buildText(BuildContext context, String text) {
    return Text(
      text,
      maxLines: 1,
      style: Theme.of(context).textTheme.subtitle2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
