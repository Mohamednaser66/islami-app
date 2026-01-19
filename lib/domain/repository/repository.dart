import 'package:dartz/dartz.dart';
import 'package:islami_c14_offline_sun/core/error/error.dart';
import 'package:islami_c14_offline_sun/data/models/Pray_time_response.dart';
import 'package:islami_c14_offline_sun/data/models/RadioResponse.dart';
import 'package:islami_c14_offline_sun/data/models/RecentsResponse.dart';

abstract class Repository{
  Future<Either<AppException,RadioResponse>> getRadioResponse();
  Future<Either<AppException,PrayTimeResponse>> getPrayTime();
  Future<Either<AppException,RecentsResponse>> getRecantsResponse();
}