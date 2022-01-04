

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rent_ready_task/features/accounts/data/models/search_filter_request.dart';
import 'package:rent_ready_task/features/accounts/data/repository/accounts_repository.dart';
import 'package:rent_ready_task/features/accounts/domain/search_filter_usecase.dart';
import '../mock_data.dart';
import 'search_filter_usecase_test.mocks.dart';

@GenerateMocks([AccountsRepository])
void main() {
  late SearchFilterUseCase usecase;
  late MockAccountsRepository mockAccountsRepository;

  setUp(() {
    mockAccountsRepository = MockAccountsRepository();
    usecase = SearchFilterUseCase(mockAccountsRepository);
  });

  test(
    'filter using TX should return 2 accounts',
        () async {
      // arrange
      when(mockAccountsRepository.getLocalAccounts())
          .thenAnswer((_) async => right(accountsResponse));
      // act
      final result = await usecase.call(SearchFilterCriteriaRequest(
        stateOrProvince: "TX"
      ));
      // assert
      expect(result.isRight(), true);
      expect(result.getOrElse(() => null)!.length, 2);
      verify(mockAccountsRepository.getLocalAccounts());
      verifyNoMoreInteractions(mockAccountsRepository);
    },
  );

  test(
    'filter using TX and search using account name should return 1 accounts',
        () async {
      // arrange
          when(mockAccountsRepository.getLocalAccounts())
              .thenAnswer((_) async => right(accountsResponse));
      // act
      final result = await usecase.call(SearchFilterCriteriaRequest(
          stateOrProvince: "TX",
          searchQuery: "Fourth"
      ));
      // assert
      expect(result.isRight(), true);
      expect(result.getOrElse(() => null)!.length, 1);
      verify(mockAccountsRepository.getLocalAccounts());
      verifyNoMoreInteractions(mockAccountsRepository);
    },
  );

  test(
    'filter using TX and search using account number should return 1 accounts',
        () async {
      // arrange
      when(mockAccountsRepository.getLocalAccounts())
          .thenAnswer((_) async => right(accountsResponse));
      // act
      final result = await usecase.call(SearchFilterCriteriaRequest(
          stateOrProvince: "TX",
          searchQuery: "ABS"
      ));
      // assert
      expect(result.isRight(), true);
      expect(result.getOrElse(() => null)!.length, 1);
      verify(mockAccountsRepository.getLocalAccounts());
      verifyNoMoreInteractions(mockAccountsRepository);
    },
  );

  test(
    'search using account name should return 1 accounts',
        () async {
      // arrange
      when(mockAccountsRepository.getLocalAccounts())
          .thenAnswer((_) async => right(accountsResponse));
      // act
      final result = await usecase.call(SearchFilterCriteriaRequest(
          searchQuery: "sample"
      ));
      // assert
      expect(result.isRight(), true);
      expect(result.getOrElse(() => null)!.length, 3);
      verify(mockAccountsRepository.getLocalAccounts());
      verifyNoMoreInteractions(mockAccountsRepository);
    },
  );

  test(
    'search using account number should return 1 accounts',
        () async {
      // arrange
      when(mockAccountsRepository.getLocalAccounts())
          .thenAnswer((_) async => right(accountsResponse));
      // act
      final result = await usecase.call(SearchFilterCriteriaRequest(
          searchQuery: "ABC28UU7"
      ));
      // assert
      expect(result.isRight(), true);
      expect(result.getOrElse(() => null)!.length, 1);
      verify(mockAccountsRepository.getLocalAccounts());
      verifyNoMoreInteractions(mockAccountsRepository);
    },
  );
}
