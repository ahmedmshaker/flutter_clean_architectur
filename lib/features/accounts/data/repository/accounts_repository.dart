import 'package:dartz/dartz.dart';
import 'package:rent_ready_task/core/error/response_erorr.dart';
import 'package:rent_ready_task/features/accounts/data/models/accounts_response.dart';

abstract class AccountsRepository {
  Future<Either<ResponseError, AccountsResponse>> getAccounts();

  Future<Either<ResponseError, AccountsResponse>> getLocalAccounts();
}
