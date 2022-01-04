// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i11;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:oauth_dio/oauth_dio.dart' as _i7;

import '../core/cache/cache.dart' as _i4;
import '../core/cache/cache_implementation.dart' as _i5;
import '../core/cache/oauth_secure_storage.dart' as _i8;
import '../core/config/app_config.dart' as _i3;
import '../features/accounts/data/local/accounts_local_data_source.dart' as _i9;
import '../features/accounts/data/local/accounts_local_data_source_impl.dart'
    as _i10;
import '../features/accounts/data/remote/services/accounts_service.dart'
    as _i12;
import '../features/accounts/data/remote/source/accounts_remote_data_source.dart'
    as _i13;
import '../features/accounts/data/remote/source/accounts_remote_data_source_impl.dart'
    as _i14;
import '../features/accounts/data/repository/accounts_repository.dart' as _i15;
import '../features/accounts/data/repository/accounts_repository_impl.dart'
    as _i16;
import '../features/accounts/domain/accounts_usecase.dart' as _i17;
import '../features/accounts/domain/get_filtered_menu_list_usecase.dart'
    as _i18;
import '../features/accounts/domain/search_filter_usecase.dart' as _i19;
import '../features/accounts/presentation/cubit/accounts_cubit.dart' as _i20;
import 'app_module.dart' as _i21; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  gh.lazySingleton<_i3.AppConfig>(() => _i3.AppConfig());
  gh.lazySingleton<_i4.Cache>(() => _i5.CacheImplementation());
  gh.lazySingleton<_i6.FlutterSecureStorage>(() => appModule.storage());
  gh.factory<_i7.OAuthStorage>(
      () => _i8.OAuthSecureStorage(get<_i6.FlutterSecureStorage>()));
  gh.factory<_i9.AccountsLocalDataSource>(
      () => _i10.AccountsLocalDataSourceImpl(get<_i4.Cache>()));
  gh.lazySingleton<_i7.OAuth>(
      () => appModule.oauth(get<_i7.OAuthStorage>(), get<_i3.AppConfig>()));
  gh.lazySingleton<_i11.Dio>(
      () => appModule.dio(get<_i7.OAuth>(), get<_i3.AppConfig>()));
  gh.factory<_i12.AccountsService>(() => _i12.AccountsService(get<_i11.Dio>()));
  gh.factory<_i13.AccountsRemoteDataSource>(
      () => _i14.AccountsRemoteDataSourceImpl(get<_i12.AccountsService>()));
  gh.factory<_i15.AccountsRepository>(() => _i16.AccountsRepositoryImpl(
      get<_i13.AccountsRemoteDataSource>(),
      get<_i9.AccountsLocalDataSource>()));
  gh.factory<_i17.AccountsUseCase>(
      () => _i17.AccountsUseCase(get<_i15.AccountsRepository>()));
  gh.factory<_i18.GetFilteredMenuListUseCase>(
      () => _i18.GetFilteredMenuListUseCase(get<_i15.AccountsRepository>()));
  gh.factory<_i19.SearchFilterUseCase>(
      () => _i19.SearchFilterUseCase(get<_i15.AccountsRepository>()));
  gh.factory<_i20.AccountsCubit>(() => _i20.AccountsCubit(
      get<_i17.AccountsUseCase>(),
      get<_i19.SearchFilterUseCase>(),
      get<_i18.GetFilteredMenuListUseCase>()));
  return get;
}

class _$AppModule extends _i21.AppModule {}
