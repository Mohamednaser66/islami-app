import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/presentation/screens/main_layout/tabs/radio/radio_widget/radio_componant.dart';
import 'package:islami_c14_offline_sun/provider/radio_view_model.dart';
import 'package:islami_c14_offline_sun/provider/states.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/colors_manager.dart';

class RadioListview extends StatelessWidget {
  const RadioListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioViewModel>(builder: (context, provider, child) {
   var state = provider.state;
      if(state is RadioLoadingState){
        return  Center(child: CircularProgressIndicator(color: ColorsManager.white,),);
      }
      if(state is RadioErrorState){
        return Center(child: Text(state.message??"Failed Loading"));
      }
      return Expanded(child: ListView.separated(itemBuilder: (context, index) {
       return RadioItem(radio: provider.radiosList![index],);
      }, separatorBuilder: (context, index) => Divider(), itemCount: provider.radiosList!.length));
    },);
  }
}
