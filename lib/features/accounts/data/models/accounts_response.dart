import 'package:rent_ready_task/features/accounts/data/models/account.dart';

class AccountsResponse {
  late final List<Account> accounts;

  AccountsResponse.fromJson(Map<String, dynamic> json) {
    accounts = (json['value'] as List<dynamic>).map((e) =>
        Account.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    return data;
  }

}