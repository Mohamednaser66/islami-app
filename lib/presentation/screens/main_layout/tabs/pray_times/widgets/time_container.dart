import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/core/assets_manager.dart';
import 'package:islami_c14_offline_sun/core/colors_manager.dart';
import 'package:islami_c14_offline_sun/data/models/Date.dart';
import 'package:islami_c14_offline_sun/presentation/screens/main_layout/tabs/pray_times/widgets/time_item.dart';
import 'package:islami_c14_offline_sun/provider/states.dart';
import 'package:islami_c14_offline_sun/provider/time_view_model.dart';
import 'package:provider/provider.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer({super.key,required this.date});
 final Date date;
  @override
  Widget build(BuildContext context) {
    return Consumer<TimeViewModel>(
      builder: (context,provider,child) {
       var state= provider.state;
        if(state is PrayTimeLoadingState){
          return Center(child:  CircularProgressIndicator(),);
        }if(state is PrayTimeErrorState){
          return Text(state.message??'Failed Loading');
        }
        return Stack(
          children: [
            Image.asset(AssetsManager.adanTime),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("${date?.gregorian?.day} ${date.gregorian?.month?.en}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: ColorsManager.white),),
                          Text("${date.gregorian?.year}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: ColorsManager.white)),
                        ],
                      ),

                      Column(
                        children: [
                          Text("Pray Time",style: TextStyle(color: ColorsManager.black.withOpacity(0.7),fontWeight: FontWeight.w700,fontSize: 20),),
                          Text("${date.gregorian?.weekday?.en}",style: TextStyle(color: ColorsManager.black.withOpacity(0.9),fontWeight: FontWeight.w700,fontSize: 20)),
                        ],
                      ),

                      Column(
                        children: [
                          Text("${date.hijri?.day} ${date.hijri?.month?.en}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: ColorsManager.white)),
                          Text("العصر",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: ColorsManager.white)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                        height: 120,
                        viewportFraction: 0.3,
                        enlargeCenterPage: true,
                        aspectRatio: 1 / 1),
                    itemBuilder: (context, index, realIndex) {
                      return TimeItem(time: provider.timing?.values.elementAt(index)??'',tittle: provider.timing?.keys.elementAt(index)??'',);
                    },
                    itemCount: 10,
                  )
                ],
              ),
            )
          ],
        );
      }
    );
  }
}
