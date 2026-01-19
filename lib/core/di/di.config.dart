// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_service.dart' as _i307;
import '../../data/datasource_service/datasource_service.dart' as _i357;
import '../../data/datasource_service/datasource_service_impl.dart' as _i466;
import '../../data/repository_impl/repository_impl.dart' as _i109;
import '../../domain/repository/repository.dart' as _i131;
import '../../domain/use_case/use_case.dart' as _i719;
import '../../provider/radio_view_model.dart' as _i731;
import '../../provider/time_view_model.dart' as _i792;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i307.ApiService>(() => _i307.ApiService());
    gh.factory<_i357.DatasourceService>(
        () => _i466.DatasourceServiceImpl(gh<_i307.ApiService>()));
    gh.factory<_i131.Repository>(
        () => _i109.RepositoryImpl(gh<_i357.DatasourceService>()));
    gh.factory<_i719.UseCase>(() => _i719.UseCase(gh<_i131.Repository>()));
    gh.factory<_i731.RadioViewModel>(
        () => _i731.RadioViewModel(gh<_i719.UseCase>()));
    gh.factory<_i792.TimeViewModel>(
        () => _i792.TimeViewModel(gh<_i719.UseCase>()));
    return this;
  }
}
