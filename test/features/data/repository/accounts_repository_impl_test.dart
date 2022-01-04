import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rent_ready_task/core/error/exceptions.dart';
import 'package:rent_ready_task/features/accounts/data/local/accounts_local_data_source.dart';
import 'package:rent_ready_task/features/accounts/data/remote/source/accounts_remote_data_source.dart';
import 'package:rent_ready_task/features/accounts/data/repository/accounts_repository_impl.dart';

import '../../mock_data.dart';
import 'accounts_repository_impl_test.mocks.dart';

@GenerateMocks([AccountsRemoteDataSource, AccountsLocalDataSource])
void main() {
  late AccountsRepositoryImpl repository;
  late MockAccountsRemoteDataSource mockRemoteDataSource;
  late MockAccountsLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockAccountsRemoteDataSource();
    mockLocalDataSource = MockAccountsLocalDataSource();
    repository =
        AccountsRepositoryImpl(mockRemoteDataSource, mockLocalDataSource);
  });

  group('get remote accounts and save it to local datasource', () {
    test(
      'return account response',
      () async {
        // arrange
        when(mockRemoteDataSource.getAccounts())
            .thenAnswer((_) async => accountsResponse);
        // act
        final result = await repository.getAccounts();
        // assert
        verify(mockRemoteDataSource.getAccounts());
        verify(mockLocalDataSource.saveAccounts(accountsResponse));
        expect(result.isRight(), true);
        expect(result, equals(right(accountsResponse)));
      },
    );

    test(
      'should return failure',
      () async {
        // arrange
        when(mockRemoteDataSource.getAccounts()).thenThrow(ServerException());
        // act
        final result = await repository.getAccounts();
        // assert
        verify(mockRemoteDataSource.getAccounts());
        expect(result.isLeft(), true);
      },
    );
  });

  group('get account from Local Data source', () {
    test(
      'get Local accounts',
      () async {
        // arrange
        when(mockLocalDataSource.getAccounts())
            .thenAnswer((_) async => accountsResponse);
        // act
        final result = await repository.getLocalAccounts();
        // assert
        verify(mockLocalDataSource.getAccounts());
        expect(result.isRight(), true);
      },
    );

    test(
      'get Local accounts return failure',
      () async {
        // arrange
        when(mockLocalDataSource.getAccounts()).thenThrow(Exception());
        // act
        final result = await repository.getLocalAccounts();
        // assert
        verify(mockLocalDataSource.getAccounts());
        expect(result.isLeft(), true);
      },
    );
  });
}
