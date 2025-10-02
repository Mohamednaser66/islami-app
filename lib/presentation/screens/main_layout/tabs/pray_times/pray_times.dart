import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/core/assets_manager.dart';
import 'package:islami_c14_offline_sun/core/colors_manager.dart';
import 'package:islami_c14_offline_sun/presentation/screens/main_layout/tabs/pray_times/widgets/azkar_list_view.dart';
import 'package:islami_c14_offline_sun/presentation/screens/main_layout/tabs/pray_times/widgets/time_container.dart';
import 'package:islami_c14_offline_sun/provider/time_view_model.dart';
import 'package:provider/provider.dart';

class PrayTimes extends StatelessWidget {
  const PrayTimes({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage(AssetsManager.timeBg), fit: BoxFit.cover)),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ChangeNotifierProvider(create:  (context) => TimeViewModel()..getTimeResponse(),
            child: Consumer<TimeViewModel>(
              builder: (context,provider,child) {
                return Column(
                  children: [
                    Image.asset(
                      AssetsManager.islamiLogo,
                      height: size.height * 0.2,
                    ),
                    TimeContainer(date: provider.date,),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Azkar",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: ColorsManager.ofWhite),
                    ),
                    Expanded(child: AzkarListView())
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
