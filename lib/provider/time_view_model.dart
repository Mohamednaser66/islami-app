

import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/data/api_service.dart';
import 'package:islami_c14_offline_sun/models/Pray_time_response.dart';


class TimeViewModel extends ChangeNotifier{
  bool isLoading =false;
  String? errorMessage;
 PrayTimeResponse? responseData;
 get date => responseData?.data?.date;
 Map<String,dynamic>? get timing =>responseData?.data?.timings?.toJson();
 Future<void> getTimeResponse()async{
    isLoading =true;
    errorMessage=null;
    try{
   var response=await ApiService.getPrayTime();
   responseData=response;
   isLoading=false;
      errorMessage=null;

    }catch(e){
      isLoading=false;
      errorMessage =e.toString();

    }
    notifyListeners();
  }
}