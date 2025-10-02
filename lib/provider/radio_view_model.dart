
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/data/api_service.dart';
import 'package:islami_c14_offline_sun/models/Radios.dart';
import 'package:islami_c14_offline_sun/models/Reciters.dart';

class RadioViewModel extends ChangeNotifier{
  RadioViewModel(){
    getReciters();
    getRadio();
  }
  List<Radios> radiosList =[];
  bool isRadioSelected=true;
  bool isLoading =false;
  String? errorMessage;

  changeRadio(bool isRadio){
    if(isRadio==isRadioSelected)return;
    isRadioSelected=isRadio;
    notifyListeners();
}
 Future<void> getRadio()async {
    isLoading =true;
    errorMessage =null;
    notifyListeners();


 try{

   var  result = await ApiService.getRadioResponse();
    radiosList =result.radios!;
    isLoading =false;
    errorMessage =null;
 }catch(e){
isLoading=false;
errorMessage=e.toString();
 }
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
  List<Reciters> recitersList =[];
  Future<void> getReciters()async{
    isRecitersLoading =true;
    recitersErrorMessage=null;
    try{
   var response= await ApiService.getRecentsResponse();
     recitersList= response.reciters!;
     isRecitersLoading=false;
     recitersErrorMessage=null;
    }catch(e){
      errorMessage=e.toString();
    }
notifyListeners();
  }


}