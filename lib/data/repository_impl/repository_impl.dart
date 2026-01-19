import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:islami_c14_offline_sun/core/error/error.dart';
import 'package:islami_c14_offline_sun/data/datasource_service/datasource_service.dart';
import 'package:islami_c14_offline_sun/data/models/Pray_time_response.dart';
import 'package:islami_c14_offline_sun/data/models/RadioResponse.dart';
import 'package:islami_c14_offline_sun/data/models/RecentsResponse.dart';
import 'package:islami_c14_offline_sun/domain/repository/repository.dart';
@Injectable(as: Repository)
class RepositoryImpl implements Repository{
  DatasourceService _datasource;
  @factoryMethod
  RepositoryImpl(this._datasource);
  @override
  Future<Either<AppException,PrayTimeResponse>> getPrayTime()async {
    try{
  var response= await  _datasource.getPrayTime();
   return Right(response);
    }on AppException catch(exception){
      return Left(AppException(exception.message));
    }
  }

  @override
  Future<Either<AppException, RadioResponse>> getRadioResponse()async {
    try{
      var response= await  _datasource.getRadioResponse();
      return Right(response);
    }on AppException catch(exception){
      return Left(AppException(exception.message));
    }
  }

  @override
  Future<Either<AppException,RecentsResponse>> getRecantsResponse() async{
    try{
      var response= await  _datasource.getRecantsResponse();
      return Right(response);
    }on AppException catch(exception){
      return Left(AppException(exception.message));
    }
  }

}