import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_ready_task/features/accounts/presentation/cubit/accounts_cubit.dart';
import 'package:rent_ready_task/features/accounts/presentation/cubit/accounts_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterWidget extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onSelected;

  const FilterWidget({Key? key, this.controller, this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsCubit, AccountsState>(builder: (context, state) {
      if (state.isSuccessful) {
        return _buildMenuList(context);
      } else {
        return _buildFilterButtonWidget(context);
      }
    });
  }

  Widget _buildMenuList(BuildContext context) {
    return FutureBuilder<Set<String>>(
        future: context.read<AccountsCubit>().getFilterList(),
        builder: (context, snapshot) {
          return PopupMenuButton<String>(
              child: _buildFilterButtonWidget(context),
              onSelected: (value) {
                controller?.text = value;
                onSelected?.call(value);
              },
              itemBuilder: (BuildContext context) => snapshot.requireData
                  .map((e) => PopupMenuItem(
                        value: e,
                        child: Text(
                            AppLocalizations.of(context)!.stateOrProvince(e)),
                      ))
                  .toList());
        });
  }

  Widget _buildFilterButtonWidget(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.filter_alt_sharp),
        const SizedBox(
          width: 4,
        ),
        Text(
          AppLocalizations.of(context)!.filter,
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }
}
