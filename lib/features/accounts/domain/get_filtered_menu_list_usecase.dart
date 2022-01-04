import 'package:dartz/dartz.dart';
import 'package:rent_ready_task/core/error/response_erorr.dart';
import 'package:rent_ready_task/core/usecases/use_case.dart';
import 'package:rent_ready_task/features/accounts/data/models/account.dart';
import 'package:rent_ready_task/features/accounts/data/models/search_filter_request.dart';

import '../data/repository/accounts_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetFilteredMenuListUseCase
    implements BaseUseCase<Set<String>?, NoParam> {
  final AccountsRepository repository;

  const GetFilteredMenuListUseCase(this.repository);

  @override
  Future<Either<ResponseError, Set<String>?>> call(
      NoParam noParam) async {
    final accountsResponse = await repository.getLocalAccounts();
    return accountsResponse.fold(
        (cacheFailure) => left(cacheFailure),
        (successData) => right(successData.accounts.map((e) => e.address1Stateorprovince).toSet()));
  }

}
