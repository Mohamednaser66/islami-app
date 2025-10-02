import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/core/assets_manager.dart';
import 'package:islami_c14_offline_sun/core/colors_manager.dart';
import 'package:islami_c14_offline_sun/models/Radios.dart';
import 'package:islami_c14_offline_sun/provider/radio_view_model.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatelessWidget {
  const RadioItem({super.key, required this.radio});

 final Radios radio;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.gold,
        image: DecorationImage(image: AssetImage(AssetsManager.radioItem)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Consumer<RadioViewModel>(
        builder: (context,provider,child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                radio.name??'',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: ColorsManager.black),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: (){
                        provider.playAudio(radio.url??'');
                      },
                      child: Icon((provider.isPlay &&provider.currentUrl==radio.url)?Icons.pause:Icons.play_arrow)),
                  InkWell(
                      onTap: (){
                        provider.toggleAudio(radio.url??'');
                      },
                      child: Icon((provider.isMute&&radio.url==provider.currentUrl)?Icons.volume_off:Icons.volume_down_alt))
                ],
              )
            ],
          );
        }
      ),
    );
  }
}
