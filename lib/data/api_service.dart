import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:islami_c14_offline_sun/data/models/Pray_time_response.dart';
import 'package:islami_c14_offline_sun/data/models/RadioResponse.dart';
import 'package:islami_c14_offline_sun/data/models/RecentsResponse.dart';

@singleton
class ApiService {
   Future<RadioResponse> getRadioResponse() async {
    Uri url = Uri.parse('https://mp3quran.net/api/v3/radios?language=ar');
    var response = await http.get(url);

      var json = jsonDecode(response.body);
      return RadioResponse.fromJson(json);

  }
   Future<RecentsResponse> getRecantsResponse()async{
    Uri url =Uri.parse('https://www.mp3quran.net/api/v3/reciters?language=ar');
    http.Response response= await http.get(url);
    var json =jsonDecode(response.body);
    return RecentsResponse.fromJson(json);
  }
   Future<PrayTimeResponse> getPrayTime()async{
    Uri url =Uri.parse('https://api.aladhan.com/v1/timingsByCity/16-07-2024?city=cairo&country=egypt');
   http.Response response=await  http.get(url);
   var json =jsonDecode(response.body);
   return PrayTimeResponse.fromJson(json);
  }
}
