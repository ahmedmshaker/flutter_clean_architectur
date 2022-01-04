import 'package:dartz/dartz.dart';
import 'package:rent_ready_task/core/error/response_erorr.dart';
import 'package:rent_ready_task/core/usecases/use_case.dart';
import 'package:rent_ready_task/features/accounts/data/models/accounts_response.dart';

import '../data/repository/accounts_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AccountsUseCase
    implements BaseUseCase<AccountsResponse?, NoParam> {
  final AccountsRepository repository;

  const AccountsUseCase(this.repository);

  @override
  Future<Either<ResponseError, AccountsResponse?>> call(
      NoParam noParam) {
    return repository.getAccounts();
  }

}
