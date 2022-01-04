import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_ready_task/core/usecases/use_case.dart';
import 'package:rent_ready_task/features/accounts/data/models/search_filter_request.dart';
import 'package:rent_ready_task/features/accounts/domain/get_filtered_menu_list_usecase.dart';
import 'package:rent_ready_task/features/accounts/domain/search_filter_usecase.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/list_grid_switcher.dart';

import '../../domain/accounts_usecase.dart';
import 'package:injectable/injectable.dart';
import 'accounts_state.dart';

@injectable
class AccountsCubit extends Cubit<AccountsState> {
  final AccountsUseCase _accountsUseCase;
  final SearchFilterUseCase _searchFilterUseCase;
  final GetFilteredMenuListUseCase _getFilteredMenuListUseCase;

  AccountsCubit(this._accountsUseCase, this._searchFilterUseCase,
      this._getFilteredMenuListUseCase)
      : super(AccountsState.initial());

  Future<void> getAccounts() async {
    emit(AccountsState.loading());
    final response = await _accountsUseCase.call(NoParam());
    emit(response.fold(
        (l) => AccountsState.failure(l.message ?? ""),
        (r) => AccountsState.success(
            r?.accounts ?? List.empty(), state.listGridSwitchType)));
  }

  void switchListGridView(ListGridSwitcherType listGridSwitchType) {
    emit(AccountsState.success(state.accounts, listGridSwitchType));
  }

  Future<void> searchOrFilter(SearchFilterCriteriaRequest request) async {
    final response = await _searchFilterUseCase.call(request);
    emit(response.fold(
        (l) => AccountsState.failure(l.message ?? ""),
        (r) => AccountsState.success(
            r ?? List.empty(), state.listGridSwitchType)));
  }

  Future<Set<String>> getFilterList() async {
    final filterMenuList = await _getFilteredMenuListUseCase.call(NoParam());
    return Future.value(filterMenuList.getOrElse(() => Set.identity()));
  }
}
