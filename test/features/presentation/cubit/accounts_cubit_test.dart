import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rent_ready_task/core/usecases/use_case.dart';
import 'package:rent_ready_task/features/accounts/data/models/search_filter_request.dart';
import 'package:rent_ready_task/features/accounts/domain/accounts_usecase.dart';
import 'package:rent_ready_task/features/accounts/domain/get_filtered_menu_list_usecase.dart';
import 'package:rent_ready_task/features/accounts/domain/search_filter_usecase.dart';
import 'package:rent_ready_task/features/accounts/presentation/cubit/accounts_cubit.dart';
import 'package:rent_ready_task/features/accounts/presentation/cubit/accounts_state.dart';
import 'package:rent_ready_task/features/accounts/presentation/widgets/list_grid_switcher.dart';
import '../../mock_data.dart';
import 'accounts_cubit_test.mocks.dart';

@GenerateMocks([AccountsUseCase])
@GenerateMocks([GetFilteredMenuListUseCase])
@GenerateMocks([SearchFilterUseCase])
void main() {
  late AccountsCubit cubit;
  late AccountsUseCase accountsUseCase;
  late GetFilteredMenuListUseCase getFilteredMenuListUseCase;
  late SearchFilterUseCase searchFilterUseCase;

  setUp(() {
    accountsUseCase = MockAccountsUseCase();
    getFilteredMenuListUseCase = MockGetFilteredMenuListUseCase();
    searchFilterUseCase = MockSearchFilterUseCase();

    cubit = AccountsCubit(
      accountsUseCase,
      searchFilterUseCase,
      getFilteredMenuListUseCase,
    );
  });

  group('Get Accounts response', () {
    NoParam noParam = NoParam();
    test(
      'verify accounts method in the usecase',
      () async* {
        // arrange
        when(accountsUseCase(noParam))
            .thenAnswer((_) async => right(accountsResponse));
        // act
        cubit.getAccounts();
        await untilCalled(accountsUseCase(noParam));
        // assert
        verify(accountsUseCase(noParam));
      },
    );

    test(
      'GetAccounts response states till success',
      () async* {
        // arrange
        when(accountsUseCase(noParam))
            .thenAnswer((_) async => right(accountsResponse));
        // assert later
        final expected = [
          AccountsState.loading(),
          AccountsState.success(
              accountsResponse.accounts, ListGridSwitcherType.listView),
        ];
        expectLater(cubit.state, emitsInOrder(expected));
        // act
        cubit.getAccounts();
      },
    );

    test(
      'GetAccounts response states till failure',
      () async* {
        // arrange
        when(accountsUseCase(noParam))
            .thenAnswer((_) async => left(serverFailure));
        // assert later
        final expected = [
          AccountsState.loading(),
          AccountsState.failure(""),
        ];
        expectLater(cubit.state, emitsInOrder(expected));
        // act
        cubit.getAccounts();
      },
    );
  });

  group('Search And Filter Accounts response', () {
    test(
      'verify searchFilterUseCase method in the usecase',
      () async* {
        // arrange
        final searchRequest = SearchFilterCriteriaRequest();
        when(searchFilterUseCase(searchRequest))
            .thenAnswer((_) async => right(accountsResponse.accounts));
        // act
        cubit.searchOrFilter(searchRequest);
        await untilCalled(searchFilterUseCase(searchRequest));
        // assert
        verify(searchFilterUseCase(searchRequest));
      },
    );

    test(
      'searchFilterUseCase response states till success',
      () async* {
        // arrange
        final searchRequest = SearchFilterCriteriaRequest();
        when(searchFilterUseCase(searchRequest))
            .thenAnswer((_) async => right(accountsResponse.accounts));
        // assert later
        final expected = [
          AccountsState.success(
              accountsResponse.accounts, ListGridSwitcherType.listView),
        ];
        expectLater(cubit.state, emitsInOrder(expected));
        // act
        cubit.searchOrFilter(searchRequest);
      },
    );

    test(
      'searchFilterUseCase response states till failure',
      () async* {
        // arrange
        final searchRequest = SearchFilterCriteriaRequest();
        when(searchFilterUseCase(searchRequest))
            .thenAnswer((_) async => left(cacheFailure));
        // assert later
        final expected = [
          AccountsState.failure(""),
        ];
        expectLater(cubit.state, emitsInOrder(expected));
        // act
        cubit.searchOrFilter(searchRequest);
      },
    );
  });
}
