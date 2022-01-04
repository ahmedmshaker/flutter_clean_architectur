import 'package:dartz/dartz.dart';
import 'package:rent_ready_task/core/error/exceptions.dart';

import 'package:rent_ready_task/core/error/response_erorr.dart';
import 'package:rent_ready_task/features/accounts/data/local/accounts_local_data_source.dart';

import 'package:rent_ready_task/features/accounts/data/models/accounts_response.dart';

import '../remote/source/accounts_remote_data_source.dart';
import 'package:injectable/injectable.dart';

import 'accounts_repository.dart';

@Injectable(as: AccountsRepository)
class AccountsRepositoryImpl implements AccountsRepository {
  final AccountsRemoteDataSource remoteDataSource;
  final AccountsLocalDataSource localDataSource;

  const AccountsRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<ResponseError, AccountsResponse>> getAccounts() async {
    try {
      final accountResponse = await remoteDataSource.getAccounts();
      localDataSource.saveAccounts(accountResponse);
      return right(accountResponse);
    } on ServerException catch (error) {
      return left(
          ServerFailure(message: error.message, statusCode: error.statusCode));
    }
  }

  @override
  Future<Either<ResponseError, AccountsResponse>> getLocalAccounts() async {
    try {
      final response = await localDataSource.getAccounts();
      return right(response);
    } on Exception catch (error) {
      return left(const CacheFailure(
          message: "error fetching accounts", statusCode: "-1"));
    }
  }
}
