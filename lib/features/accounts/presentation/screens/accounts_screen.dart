import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_ready_task/di/injection_container.dart';
import 'package:rent_ready_task/features/accounts/presentation/cubit/accounts_cubit.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/accounts_grid_view_widget.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/accounts_list_view_widget.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/actions_bar_widget.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/list_grid_switcher.dart';
import '../cubit/accounts_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountsScreen extends StatefulWidget {
  final EdgeInsets? margin;

  const AccountsScreen({Key? key, this.margin}) : super(key: key);

  @override
  _AccountsScreenState createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  late AccountsCubit _accountsCubit;

  @override
  void initState() {
    super.initState();
    _accountsCubit = getIt<AccountsCubit>();
    _accountsCubit.getAccounts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _accountsCubit,
        child: BlocBuilder<AccountsCubit, AccountsState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: Container(
                  margin: widget.margin,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      const ActionsBarWidget(),
                      const SizedBox(
                        height: 32,
                      ),
                      _buildBodyWidget(state),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  Widget _buildEmptyMessage() {
    return Expanded(
      child: Center(
        child: Text(AppLocalizations.of(context)!.emptyMessage),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return const Expanded(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildBodyWidget(AccountsState state) {
    if (state.isSuccessful) {
      return buildAccountsScreen(state);
    } else if (state.isLoading) {
      return _buildLoadingWidget();
    } else {
      return _buildEmptyMessage();
    }
  }

  Widget buildAccountsScreen(AccountsState state) {
    return Expanded(
      child: state.listGridSwitchType == ListGridSwitcherType.gridView
          ? AccountsGridViewWidget(
              accounts: state.accounts,
            )
          : AccountsListViewWidget(accounts: state.accounts),
    );
  }
}
