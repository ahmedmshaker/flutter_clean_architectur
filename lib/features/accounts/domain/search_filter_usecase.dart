import 'package:dartz/dartz.dart';
import 'package:rent_ready_task/core/error/response_erorr.dart';
import 'package:rent_ready_task/core/usecases/use_case.dart';
import 'package:rent_ready_task/features/accounts/data/models/account.dart';
import 'package:rent_ready_task/features/accounts/data/models/search_filter_request.dart';

import '../data/repository/accounts_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SearchFilterUseCase
    implements BaseUseCase<List<Account>?, SearchFilterCriteriaRequest> {
  final AccountsRepository repository;

  const SearchFilterUseCase(this.repository);

  @override
  Future<Either<ResponseError, List<Account>?>> call(
      SearchFilterCriteriaRequest request) async {
    final accountsResponse = await repository.getLocalAccounts();
    return accountsResponse.fold(
        (cacheFailure) => left(cacheFailure),
        (successData) => right(successData.accounts
            .where((element) =>
                _handleSearch(element, request.searchQuery) &&
                _handleFilter(element, request.stateOrProvince))
            .toList()));
  }

  bool _handleSearch(Account account, String? query) {
    if (query == null || query.isEmpty) {
      return true;
    } else {
      return account.accountnumber
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          account.name.toLowerCase().contains(query.toLowerCase());
    }
  }

  bool _handleFilter(Account account, String? stateOrProvince) {
    if (stateOrProvince == null || stateOrProvince.isEmpty) {
      return true;
    } else {
      return account.address1Stateorprovince == stateOrProvince;
    }
  }
}
