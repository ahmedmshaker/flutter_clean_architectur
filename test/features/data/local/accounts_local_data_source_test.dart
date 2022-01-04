import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rent_ready_task/core/cache/cache.dart';
import 'package:rent_ready_task/core/error/exceptions.dart';
import 'package:rent_ready_task/features/accounts/data/local/accounts_local_data_source_impl.dart';
import 'package:rent_ready_task/features/accounts/data/models/accounts_response.dart';
import 'accounts_local_data_source_test.mocks.dart';

import '../../mock_data.dart';

@GenerateMocks([Cache])
void main() {
  late AccountsLocalDataSourceImpl dataSource;
  late MockCache mockCache;
  Type type = AccountsResponse;

  setUp(() {
    mockCache = MockCache();
    dataSource = AccountsLocalDataSourceImpl(
      mockCache,
    );
  });

  group('get Accounts', () {
    test(
      'should return Accounts response from Cache when there is one in the cache',
      () async {
        // arrange
        when(mockCache.get(type.toString())).thenReturn(accountsResponse);
        // act
        final result = await dataSource.getAccounts();
        // assert
        verify(mockCache.get(type.toString()));
        expect(result, equals(accountsResponse));
      },
    );

    test(
      'should throw a CacheExeption when there is not a cached value',
      () async {
        // arrange
        when(mockCache.get(type.toString())).thenThrow(CacheException());
        // act
        final call = dataSource.getAccounts;
        // assert
        expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });

  group('cache Accounts Response', () {
    test(
      'should call Cache to cache the Accounts Response',
      () async {
        // act
        dataSource.saveAccounts(accountsResponse);
        // assert
        verify(mockCache.set(type.toString(), accountsResponse));
      },
    );
  });
}
