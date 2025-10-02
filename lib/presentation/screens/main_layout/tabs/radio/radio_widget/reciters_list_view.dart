import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/presentation/screens/main_layout/tabs/radio/radio_widget/reciters_item.dart';
import 'package:islami_c14_offline_sun/provider/radio_view_model.dart';
import 'package:provider/provider.dart';

class RecitersListView extends StatelessWidget {
  const RecitersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioViewModel>(
      builder: (context,provider,child) {
        if(provider.isRecitersLoading){
          return Center(child: CircularProgressIndicator(
          ),);
        }if(provider.recitersErrorMessage!=null){
         return Text(provider.recitersErrorMessage!);
        }
        return Expanded(
          child: ListView.separated(itemBuilder: (context, index) {
            return RecitersItem(reciter: provider.recitersList[index]);
          }, separatorBuilder: (context, index) => Divider(), itemCount: provider.recitersList.length),
        );
      }
    );
  }
}
