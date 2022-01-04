import 'package:rent_ready_task/features/accounts/data/models/accounts_response.dart';

import '../services/accounts_service.dart';
import 'package:injectable/injectable.dart';

import 'accounts_remote_data_source.dart';

@Injectable(as: AccountsRemoteDataSource)
class AccountsRemoteDataSourceImpl implements AccountsRemoteDataSource {
  final AccountsService _service;

  const AccountsRemoteDataSourceImpl(this._service);

  @override
  Future<AccountsResponse> getAccounts() {
   return _service.getAccounts();
  }
}
