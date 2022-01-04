import 'package:rent_ready_task/core/cache/cache.dart';
import 'package:rent_ready_task/features/accounts/data/local/accounts_local_data_source.dart';
import 'package:rent_ready_task/features/accounts/data/models/accounts_response.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: AccountsLocalDataSource)
class AccountsLocalDataSourceImpl implements AccountsLocalDataSource {
  final Cache _cache;

  const AccountsLocalDataSourceImpl(this._cache);

  @override
  Future<AccountsResponse> getAccounts() {
    Type type = AccountsResponse;
    return Future.value(_cache.get<AccountsResponse?>(type.toString()));
  }

  @override
  void saveAccounts(AccountsResponse? accountsResponse) {
    Type type = AccountsResponse;
    _cache.set(type.toString(), accountsResponse);
  }
}
