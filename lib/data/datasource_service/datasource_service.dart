import 'package:islami_c14_offline_sun/data/models/Pray_time_response.dart';
import 'package:islami_c14_offline_sun/data/models/RadioResponse.dart';
import 'package:islami_c14_offline_sun/data/models/RecentsResponse.dart';

abstract class DatasourceService {
  Future<RadioResponse> getRadioResponse();
  Future<PrayTimeResponse> getPrayTime();
  Future<RecentsResponse> getRecantsResponse();
}