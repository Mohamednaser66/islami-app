import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c14_offline_sun/core/assets_manager.dart';
import 'package:islami_c14_offline_sun/core/colors_manager.dart';
import 'package:islami_c14_offline_sun/presentation/screens/main_layout/tabs/quran/widgets/sura_widget.dart';
import 'package:islami_c14_offline_sun/presentation/screens/quran_details/widgets/sura_content.dart';
import 'package:islami_c14_offline_sun/provider/islami_view_model.dart';
import 'package:provider/provider.dart';

class QuranDetails extends StatefulWidget {
  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  late SuraDetailsArguments arguments;
  String suraContent = '';

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    arguments =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArguments;
    loadSuraContent();
  }

  loadSuraContent()async{
    var provider =Provider.of<IslamiViewModel>(context,listen: false);
    await provider.loadSuraContent(arguments.suraIndex);
setState(() {
  suraContent =provider.suraContent??'';

});

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    arguments.mostRecentSurasKey?.currentState?.getMostRecentSuras();
  }

  @override
  Widget build(BuildContext context) {
    /// parallel ???
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.suraNameEn),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AssetsManager.quranDetailsPatternLeft),
                    Image.asset(
                      AssetsManager.quranDetailsPatternRight,
                    ),
                  ],
                ),
                Text(
                  arguments.suraNameAr,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.gold),
                ),
              ],
            ),
            suraContent.isEmpty
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : SuraContent(suraContent: suraContent),
            Image.asset(AssetsManager.quranDetailsImage)
          ],
        ),
      ),
    );
  }


}
