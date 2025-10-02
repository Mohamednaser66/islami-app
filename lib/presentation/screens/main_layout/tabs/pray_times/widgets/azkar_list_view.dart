import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/core/assets_manager.dart';
import 'package:islami_c14_offline_sun/core/colors_manager.dart';

class AzkarListView extends StatelessWidget {
  const AzkarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 20,mainAxisSpacing: 20),
        itemCount: 10,
        itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
          border:   Border.all(color: ColorsManager.gold,width: 2)
          ),
       child: Column(
         children: [Expanded(flex: 3,
             child: Image.asset(AssetsManager.azkar)),
         Expanded(flex: 1,
             child: Text("azkar",style: TextStyle(color: ColorsManager.white),))],
       ), );
        },);
  }
}
