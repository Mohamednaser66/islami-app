import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:islami_c14_offline_sun/models/Pray_time_response.dart';
import 'package:islami_c14_offline_sun/models/RadioResponse.dart';
import 'package:islami_c14_offline_sun/models/RecentsResponse.dart';

class ApiService {
  static Future<RadioResponse> getRadioResponse() async {
    Uri url = Uri.parse('https://mp3quran.net/api/v3/radios?language=ar');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return RadioResponse.fromJson(json);
    } else {
      throw Exception('Failed to load radios: ${response.statusCode}');
    }
  }
  static Future<RecentsResponse> getRecentsResponse()async{
    Uri url =Uri.parse('https://www.mp3quran.net/api/v3/reciters?language=ar');
    http.Response response= await http.get(url);
    var json =jsonDecode(response.body);
    return RecentsResponse.fromJson(json);
  }
  static Future<PrayTimeResponse> getPrayTime()async{
    Uri url =Uri.parse('https://api.aladhan.com/v1/timingsByCity/16-07-2024?city=cairo&country=egypt');
   http.Response response=await  http.get(url);
   var json =jsonDecode(response.body);
   return PrayTimeResponse.fromJson(json);
  }
}
