

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rent_ready_task/core/usecases/use_case.dart';
import 'package:rent_ready_task/features/accounts/data/repository/accounts_repository.dart';
import 'package:rent_ready_task/features/accounts/domain/get_filtered_menu_list_usecase.dart';
import '../mock_data.dart';
import 'get_filtered_menu_list_usecase_test.mocks.dart';

@GenerateMocks([AccountsRepository])
void main() {
  late GetFilteredMenuListUseCase usecase;
  late MockAccountsRepository mockAccountsRepository;

  setUp(() {
    mockAccountsRepository = MockAccountsRepository();
    usecase = GetFilteredMenuListUseCase(mockAccountsRepository);
  });

  test(
    'should get Accounts response from the repository',
        () async {
      // arrange
      when(mockAccountsRepository.getLocalAccounts())
          .thenAnswer((_) async => right(accountsResponse));
      // act
      final result = await usecase.call(NoParam());
      // assert
      expect(result.isRight(), true);
      verify(mockAccountsRepository.getLocalAccounts());
      verifyNoMoreInteractions(mockAccountsRepository);
    },
  );

  test(
    'should get Cache Failure',
        () async {
      // arrange
      when(mockAccountsRepository.getLocalAccounts())
          .thenAnswer((_) async => left(cacheFailure));
      // act
      final result = await usecase.call(NoParam());
      // assert
      expect(result, left(cacheFailure));
      verify(mockAccountsRepository.getLocalAccounts());
      verifyNoMoreInteractions(mockAccountsRepository);
    },
  );
}
