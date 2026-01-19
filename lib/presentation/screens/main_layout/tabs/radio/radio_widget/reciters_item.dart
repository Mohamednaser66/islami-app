import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/core/colors_manager.dart';
import 'package:islami_c14_offline_sun/data/models/Reciters.dart';

class RecitersItem extends StatelessWidget {
  const RecitersItem({super.key,required this.reciter});
 final  Reciters reciter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.08,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorsManager.gold,
      ),
    child: Text(reciter.name??''));
  }
}
