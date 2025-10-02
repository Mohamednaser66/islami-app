import 'package:flutter/material.dart';
import 'package:islami_c14_offline_sun/core/colors_manager.dart';

class RadioTabItem extends StatelessWidget {
 const  RadioTabItem({super.key,required this.onTab,required this.isSelected,required this.tabName});

final  Function() onTab;
final bool isSelected;
final String tabName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Padding(

        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
        alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:isSelected?ColorsManager.gold:ColorsManager.black.withOpacity(0.7)
          ),
           child: Text(tabName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
           color: isSelected?ColorsManager.black:ColorsManager.ofWhite),),
        ),
      ),
    );
  }
}
