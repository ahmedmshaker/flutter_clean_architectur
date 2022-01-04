

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rent_ready_task/core/error/exceptions.dart';
import 'package:rent_ready_task/features/accounts/data/remote/services/accounts_service.dart';
import 'package:rent_ready_task/features/accounts/data/remote/source/accounts_remote_data_source_impl.dart';

import '../../mock_data.dart';
import 'accounts_remote_data_source_test.mocks.dart';


@GenerateMocks([AccountsService])
void main() {
  late AccountsRemoteDataSourceImpl dataSource;
  late MockAccountsService mockService;

  setUp(() {
    mockService = MockAccountsService();
    dataSource = AccountsRemoteDataSourceImpl(
      mockService,
    );
  });

  group('get Accounts', () {
    test(
      'should return Accounts response from Remote Service when there is one in the Remote Service',
          () async {
        // arrange
        when(mockService.getAccounts()).thenAnswer((_) async => accountsResponse);
        // act
        final result = await dataSource.getAccounts();
        // assert
        verify(mockService.getAccounts());
        expect(result, equals(accountsResponse));
      },
    );

    test(
      'should throw a ServerException',
          () {
        // arrange
        when(mockService.getAccounts()).thenThrow(ServerException());
        // act
        final call = dataSource.getAccounts;
        // assert
        expect(() => call(), throwsA(const TypeMatcher<ServerException>()));
      },
    );
  });
}
