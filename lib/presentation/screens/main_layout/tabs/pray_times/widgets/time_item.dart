import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/core/colors_manager.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({super.key,required this.tittle, required this.time});
 final String tittle;
 final String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
              colors: [ColorsManager.black, ColorsManager.gold],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Text(
                tittle,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.white),
              ),
              Text(time,style: TextStyle(color: ColorsManager.white,fontWeight: FontWeight.w700,fontSize: 32),)
             ],
          ),
        ),
      ),
    );
  }
}
