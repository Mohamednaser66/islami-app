import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:islami_c14_offline_sun/core/error/error.dart';
import 'package:islami_c14_offline_sun/data/api_service.dart';
import 'package:islami_c14_offline_sun/data/models/Pray_time_response.dart';
import 'package:islami_c14_offline_sun/data/models/RadioResponse.dart';
import 'package:islami_c14_offline_sun/data/models/RecentsResponse.dart';

import 'datasource_service.dart';
@Injectable(as: DatasourceService)
class DatasourceServiceImpl implements DatasourceService {
  ApiService _api;
  @factoryMethod
  DatasourceServiceImpl(this._api);
  @override

 Future<RadioResponse> getRadioResponse()async {
    try{
      var  response = await _api.getRadioResponse();
      return response;
    }on HttpException catch(exception){
      String? message;
      message=exception.message;
      throw AppException(message);    }

  }

  @override
  Future<PrayTimeResponse> getPrayTime()async {
    try{
  return await   _api.getPrayTime();
    }on HttpException catch(exception){
      String? message;
      message=exception.message;
      throw AppException(message);
    }
  }

  @override
  Future<RecentsResponse> getRecantsResponse() async{
    try{
      return await _api.getRecantsResponse();
    }on HttpException catch(exception){
      String? message;
      message=exception.message;
      throw AppException(message);
    }
  }

}
