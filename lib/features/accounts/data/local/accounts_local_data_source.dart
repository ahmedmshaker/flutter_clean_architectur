import 'package:rent_ready_task/features/accounts/data/models/accounts_response.dart';

abstract class AccountsLocalDataSource {

  Future<AccountsResponse> getAccounts();

  void saveAccounts(AccountsResponse? accountsResponse);
}
