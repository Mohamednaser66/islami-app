

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami_c14_offline_sun/core/error/error.dart';
import 'package:islami_c14_offline_sun/data/models/Pray_time_response.dart';
import 'package:islami_c14_offline_sun/data/models/RadioResponse.dart';
import 'package:islami_c14_offline_sun/data/models/RecentsResponse.dart';
import 'package:islami_c14_offline_sun/domain/repository/repository.dart';

@injectable
class UseCase {
  Repository _repository;
  @factoryMethod
  UseCase(this._repository);
  Future<Either<AppException,RadioResponse>> invokeGetRadio()async{
    return await _repository.getRadioResponse();
  }
  Future<Either<AppException,PrayTimeResponse>>  invokeGetTime()async{
    return await _repository.getPrayTime();
  }
  Future<Either<AppException,RecentsResponse>>  invokeGetRecants()async{
    return await _repository.getRecantsResponse();
  }
}