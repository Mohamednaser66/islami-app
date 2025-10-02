import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/presentation/screens/main_layout/tabs/radio/radio_widget/radio_componant.dart';
import 'package:islami_c14_offline_sun/provider/radio_view_model.dart';
import 'package:provider/provider.dart';

class RadioListview extends StatelessWidget {
  const RadioListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioViewModel>(builder: (context, provider, child) {
      if(provider.isLoading){
        return const Center(child: CircularProgressIndicator(),);
      }
      if(provider.errorMessage!=null){
        return Center(child: Text(provider.errorMessage!),);
      }
      return Expanded(child: ListView.separated(itemBuilder: (context, index) {
       return RadioItem(radio: provider.radiosList[index],);
      }, separatorBuilder: (context, index) => Divider(), itemCount: provider.radiosList.length));
    },);
  }
}
