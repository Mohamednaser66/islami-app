import 'package:islami_c14_offline_sun/data/models/RadioResponse.dart';
import 'package:islami_c14_offline_sun/data/models/RecentsResponse.dart';

import '../data/models/Pray_time_response.dart';

sealed class RadiosState{

}

class RadioLoadingState extends RadiosState{

}
class RadioSuccessState extends RadiosState{
  RadioResponse radio;
  RadioSuccessState({required this.radio});
}
class RadioErrorState extends RadiosState{
  String? message;
  RadioErrorState({required this.message});

}

class RecantsLoadingState extends RadiosState{

}
class RecantsSuccessState extends RadiosState{
  RecentsResponse recants;
  RecantsSuccessState({required this.recants});
}
class RecantsErrorState extends RadiosState{
  String? message;
  RecantsErrorState({required this.message});

}
sealed class PrayTimesState{

}

class PrayTimeLoadingState extends PrayTimesState{

}
class PrayTimeSuccessState extends PrayTimesState{
  PrayTimeResponse prayTime;
  PrayTimeSuccessState({required this.prayTime});
}
class PrayTimeErrorState extends PrayTimesState{
  String? message;
  PrayTimeErrorState({required this.message});

}