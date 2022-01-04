import 'package:rent_ready_task/features/accounts/data/models/accounts_response.dart';

abstract class AccountsRemoteDataSource {

  Future<AccountsResponse> getAccounts();
}
