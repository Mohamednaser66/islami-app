

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:islami_c14_offline_sun/data/models/Pray_time_response.dart';
import 'package:islami_c14_offline_sun/domain/use_case/use_case.dart';
import 'package:islami_c14_offline_sun/provider/states.dart';

@injectable
class TimeViewModel extends ChangeNotifier{
UseCase _useCase;
@factoryMethod
TimeViewModel(this._useCase);
 PrayTimeResponse? responseData;
 get date => responseData?.data?.date;
 Map<String,dynamic>? get timing =>responseData?.data?.timings?.toJson();
 PrayTimesState state =PrayTimeLoadingState();
 emit(PrayTimesState newState){
   state =newState;
 }
 Future<void> getTimeResponse()async{
 var result =await _useCase.invokeGetTime();
 result.fold((l) {
   emit(PrayTimeErrorState(message: l.message));
 }, (r) {
   responseData =r;
   emit(PrayTimeSuccessState(prayTime: r));
 },);


    notifyListeners();
  }
}