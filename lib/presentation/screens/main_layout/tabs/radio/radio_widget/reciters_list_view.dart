import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/presentation/screens/main_layout/tabs/radio/radio_widget/reciters_item.dart';
import 'package:islami_c14_offline_sun/provider/radio_view_model.dart';
import 'package:islami_c14_offline_sun/provider/states.dart';
import 'package:provider/provider.dart';

class RecitersListView extends StatelessWidget {
  const RecitersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RadioViewModel>(
      builder: (context,provider,child) {
        var state =provider.state;
        if(state is RecantsLoadingState){
          return Center(child: CircularProgressIndicator(),);
        }if(state is RecantsErrorState){
         return Text(state.message??'Failed Loading');
        }
        return Expanded(
          child: ListView.separated(itemBuilder: (context, index) {
            return RecitersItem(reciter: provider.recitersList![index]);
          }, separatorBuilder: (context, index) => Divider(), itemCount: provider.recitersList!.length),
        );
      }
    );
  }
}
