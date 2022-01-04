import 'package:built_value/built_value.dart';
import 'package:meta/meta.dart';
import 'package:rent_ready_task/features/accounts/data/models/account.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/list_grid_switcher.dart';

part 'accounts_state.g.dart';

abstract class AccountsState
    implements Built<AccountsState, AccountsStateBuilder> {
  bool get isLoading;

  List<Account> get accounts;

  ListGridSwitcherType get listGridSwitchType;

  String get error;

  bool get isInitial => !isLoading && accounts.isEmpty && error == '';

  bool get isSuccessful => !isLoading && accounts.isNotEmpty && error == '';

  const AccountsState._();

  factory AccountsState([Function(AccountsStateBuilder b) updates]) =
      _$AccountsState;

  factory AccountsState.initial() {
    return AccountsState((b) => b
      ..isLoading = false
      ..accounts = List.empty()
      ..listGridSwitchType =
          b.listGridSwitchType ?? ListGridSwitcherType.listView
      ..error = '');
  }

  factory AccountsState.loading() {
    return AccountsState((b) => b
      ..isLoading = true
      ..accounts = List.empty()
      ..listGridSwitchType =
          b.listGridSwitchType ?? ListGridSwitcherType.listView
      ..error = '');
  }

  factory AccountsState.failure(String error) {
    return AccountsState((b) => b
      ..isLoading = false
      ..accounts = List.empty()
      ..listGridSwitchType =
          b.listGridSwitchType ?? ListGridSwitcherType.listView
      ..error = error);
  }

  factory AccountsState.success(
      List<Account> resultList, ListGridSwitcherType listGridSwitchType) {
    return AccountsState((b) => b
      ..isLoading = false
      ..accounts = resultList
      ..listGridSwitchType = listGridSwitchType
      ..error = '');
  }
}
