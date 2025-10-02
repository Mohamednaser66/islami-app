import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/presentation/screens/main_layout/tabs/radio/radio_widget/radio_listview.dart';
import 'package:islami_c14_offline_sun/presentation/screens/main_layout/tabs/radio/radio_widget/reciters_list_view.dart';
import 'package:provider/provider.dart';
import 'package:islami_c14_offline_sun/core/assets_manager.dart';
import 'package:islami_c14_offline_sun/presentation/screens/main_layout/tabs/radio/radio_widget/radio_tab_item.dart';
import 'package:islami_c14_offline_sun/provider/radio_view_model.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
var  size= MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create:(context) => RadioViewModel(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsManager.radioBg),fit: BoxFit.cover)
          ),
          child: SafeArea(
            child: Consumer<RadioViewModel>(
                builder: (context,provider,child) {
                  return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AssetsManager.islamiLogo,height:size.height*0.2,),
                 Row(
                      children: [
                        Expanded(child: RadioTabItem(onTab: ()=>provider.changeRadio(true), isSelected: provider.isRadioSelected, tabName: "Radio",)),

                        Expanded(child: RadioTabItem(onTab:()=>provider.changeRadio(false), isSelected: !provider.isRadioSelected, tabName: "Reciters"))
                      ],
                    ),
                provider.isRadioSelected?RadioListview():RecitersListView()
              ],
            );}
          ),
        ),
            ),
      ));
    
  }
}
