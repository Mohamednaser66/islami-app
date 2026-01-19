import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c14_offline_sun/DM/dm.dart';

class IslamiViewModel extends ChangeNotifier{
 late HadithDM hadith;
   loadHadithFile(int index) async {
    String key = "assets/files/hadith/h${index}.txt";
    var fileContent = await rootBundle.loadString(key);
    int startLine = 0;
    int endLine = fileContent.indexOf('\n');
    String title = fileContent.substring(startLine, endLine);
    String content = fileContent.substring(endLine + 1);
    hadith = HadithDM(title: title, content: content);
    notifyListeners();
  }
}