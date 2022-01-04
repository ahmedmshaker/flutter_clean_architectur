

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rent_ready_task/core/usecases/use_case.dart';
import 'package:rent_ready_task/features/accounts/data/repository/accounts_repository.dart';
import 'package:rent_ready_task/features/accounts/domain/accounts_usecase.dart';
import '../mock_data.dart';
import 'accounts_usecase_test.mocks.dart';

@GenerateMocks([AccountsRepository])
void main() {
  late AccountsUseCase usecase;
  late MockAccountsRepository mockAccountsRepository;

  setUp(() {
    mockAccountsRepository = MockAccountsRepository();
    usecase = AccountsUseCase(mockAccountsRepository);
  });

  test(
    'should get Accounts response from the repository',
        () async {
      // arrange
      when(mockAccountsRepository.getAccounts())
          .thenAnswer((_) async => right(accountsResponse));
      // act
      final result = await usecase.call(NoParam());
      // assert
      expect(result, right(accountsResponse));
      verify(mockAccountsRepository.getAccounts());
      verifyNoMoreInteractions(mockAccountsRepository);
    },
  );

  test(
    'should get Server Failure',
        () async {
      // arrange
      when(mockAccountsRepository.getAccounts())
          .thenAnswer((_) async => left(serverFailure));
      // act
      final result = await usecase.call(NoParam());
      // assert
      expect(result, left(serverFailure));
      verify(mockAccountsRepository.getAccounts());
      verifyNoMoreInteractions(mockAccountsRepository);
    },
  );
}
