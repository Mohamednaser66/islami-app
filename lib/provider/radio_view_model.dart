
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:islami_c14_offline_sun/data/models/Radios.dart';
import 'package:islami_c14_offline_sun/data/models/Reciters.dart';
import 'package:islami_c14_offline_sun/domain/use_case/use_case.dart';
import 'package:islami_c14_offline_sun/provider/states.dart';

@injectable
class RadioViewModel extends ChangeNotifier{
  @factoryMethod
  RadioViewModel(this._useCase){
    getReciters();
    getRadio();
  }
  UseCase _useCase;
  List<Radios>? radiosList =[];
  bool isRadioSelected=true;
  RadiosState state=RadioLoadingState();

  emitRadio(RadiosState newState){
    state=newState;
  }

  changeRadio(bool isRadio){
    if(isRadio==isRadioSelected)return;
    isRadioSelected=isRadio;
    notifyListeners();
}
 Future<void> getRadio()async {
    emitRadio(RadioLoadingState());
   var  result = await _useCase.invokeGetRadio();

   result.fold((l) {
     emitRadio(RadioErrorState(message: l.message));
      
   }, (r) {
     radiosList=r.radios;
     emitRadio(RadioSuccessState(radio: r));

   },);

    notifyListeners();

 }
 bool isPlay =false;
  String? currentUrl;
  final player = AudioPlayer();

  playAudio(String url)async{
    if(currentUrl==url && isPlay== true){
      await player.pause();
      currentUrl=null;
      isPlay=false;
    }else {
      await player.stop();
    await player.play(UrlSource(url));
    currentUrl=url;
    isPlay=true;
  }
    notifyListeners();

  }

  bool isMute =false;
  toggleAudio(String url){

    if(isMute &&  currentUrl == url){
      player.setVolume(1);
      isMute=false;
    }else if(!isMute&&currentUrl == url) {
      player.setVolume(0);
      isMute=true;
    }
    notifyListeners();
  }
  bool isRecitersLoading =false;
  String? recitersErrorMessage;
  List<Reciters>? recitersList =[];
  Future<void> getReciters()async{
    emitRadio(RecantsLoadingState());
  var result =await  _useCase.invokeGetRecants();
  result.fold((l) {
    emitRadio(RecantsErrorState(message: l.message));
  }, (r) {
    recitersList =r.reciters;
    emitRadio(RecantsSuccessState(recants: r));
  },);


notifyListeners();
  }


}

