import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c14_offline_sun/DM/dm.dart';
import 'package:islami_c14_offline_sun/core/constant.dart';

class IslamiViewModel extends ChangeNotifier{
 late HadithDM hadith;
 String? suraContent;
 List<SuraDM> filteredList=[];



 Future<void>  loadHadithFile(int index) async {
    String key = "assets/files/hadith/h${index}.txt";
    var fileContent = await rootBundle.loadString(key);
    int startLine = 0;
    int endLine = fileContent.indexOf('\n');
    String title = fileContent.substring(startLine, endLine);
    String content = fileContent.substring(endLine + 1);
    hadith = HadithDM(title: title, content: content);
    notifyListeners();
  }
 Future<void> loadSuraContent(String suraIndex) async {
  String fileContent = await rootBundle
      .loadString("assets/files/suras/$suraIndex.txt"); // /blocking
  var suraLines = fileContent.trim().split("\n");
  List<String> suraLinesFinal = [];
  for (int i = 0; i < suraLines.length; i++) {
   String line = suraLines[i];
   line += "[${i + 1}]";
   suraLinesFinal.add(line);
  }
  await Future.delayed(Duration(milliseconds: 500));
   suraContent = suraLinesFinal.join();
   notifyListeners();
 }
 void getFilteredList(String searchKey) {
   filteredList = ConstantManager.suraList
       .where((suraDM) =>
   suraDM.suraNameEn.toLowerCase().contains(searchKey.toLowerCase()) ||
       suraDM.suraNameAr.contains(searchKey))
       .toList();
   notifyListeners();
 }
 void onSebhaClicked(int currentIndex,int counter, double angel ) {
   angel-=15;
   counter++;
   if(counter==33){
     counter=0;
     currentIndex++;
   }
 notifyListeners();
 }
}
