

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rent_ready_task/features/accounts/data/models/accounts_response.dart';
import 'package:retrofit/retrofit.dart';

part 'accounts_service.g.dart';

@RestApi()
@injectable
abstract class AccountsService{

  @factoryMethod
  factory AccountsService(Dio dio) = _AccountsService;

  @GET("accounts")
  Future<AccountsResponse> getAccounts();


}